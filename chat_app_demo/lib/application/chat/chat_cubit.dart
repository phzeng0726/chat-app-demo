import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/chat/chat_failure.dart';
import '../../domain/chat/chat_message.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/load_status.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final IChatRepository _chatRepository;
  ChatCubit(this._chatRepository) : super(ChatState.initial());
  StreamSubscription<Either<ChatFailure, List<ChatMessage>>>?
      _messageListSubscription;

  void init({
    required String currentUserId,
    required String otherUserId,
  }) async {
    emit(
      state.copyWith(
        loadStatus: const LoadStatus.inProgress(),
        currentUserId: currentUserId,
        otherUserId: otherUserId,
      ),
    );
    await _messageListSubscription?.cancel();
    _messageListSubscription = _chatRepository
        .watchMessageList(
          currentUserId: currentUserId,
          otherUserId: otherUserId,
        )
        .listen(
          (failureOrMessageList) => messageListReceived(failureOrMessageList),
        );
  }

  void messageListReceived(
    Either<ChatFailure, List<ChatMessage>> failureOrMessageList,
  ) {
    failureOrMessageList.fold(
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          loadStatus: const LoadStatus.failed(),
        ),
      ),
      (messageList) => emit(
        state.copyWith(
          messageList: messageList,
          failureOption: none(),
          loadStatus: const LoadStatus.succeed(),
        ),
      ),
    );
  }

  Future<void> sendMessage(String content) async {
    Either<ChatFailure, String> failureOrMessageId;
    emit(
      state.copyWith(
        isSubmitting: true,
      ),
    );
    failureOrMessageId = await _chatRepository.create(
      chatMessage: state.chatMessage.copyWith(
        fromId: state.currentUserId,
        toId: state.otherUserId,
        content: content,
      ),
    );
    
    failureOrMessageId.fold(
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          isSubmitting: false,
        ),
      ),
      (messageId) => emit(
        state.copyWith(
          sendedMessageId: messageId,
          failureOption: none(),
          isSubmitting: false,
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _messageListSubscription?.cancel();
    return super.close();
  }
}
