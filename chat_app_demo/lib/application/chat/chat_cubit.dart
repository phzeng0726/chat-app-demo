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
    required String fromId,
    required String toId,
  }) async {
    emit(
      state.copyWith(
        loadStatus: const LoadStatus.inProgress(),
        chatMessage: state.chatMessage.copyWith(
          fromId: fromId,
          toId: toId,
        ),
      ),
    );
    await _messageListSubscription?.cancel();
    _messageListSubscription = _chatRepository
        .watchChatMessageList(
          fromId: fromId,
          toId: toId,
        )
        .listen(
          (failureOrMessageList) => messageListReceived(failureOrMessageList),
        );
  }

  void messageListReceived(
      Either<ChatFailure, List<ChatMessage>> failureOrMessageList) {
    failureOrMessageList.fold(
      (f) => emit(
        state.copyWith(
          loadStatus: const LoadStatus.failed(),
        ),
      ),
      (messageList) => emit(
        state.copyWith(
          messageList: messageList,
          loadStatus: const LoadStatus.succeed(),
        ),
      ),
    );
  }

  // void chatMessageContentChanged(String chatMessageContent) {
  //   if (chatMessageContent == '') {
  //     emit(
  //       state.copyWith(
  //         writingStatus: const LoadStatus.initial(),
  //         chatMessage: state.chatMessage.copyWith(
  //           content: chatMessageContent,
  //         ),
  //       ),
  //     );
  //   } else {
  //     emit(
  //       state.copyWith(
  //         writingStatus: const LoadStatus.inProgress(),
  //         chatMessage: state.chatMessage.copyWith(
  //           content: chatMessageContent,
  //         ),
  //       ),
  //     );
  //   }
  // }

  // void textClear() {
  //   emit(
  //     state.copyWith(
  //       chatMessage: state.chatMessage.copyWith(
  //         content: '',
  //       ),
  //     ),
  //   );
  // }

  Future<void> sendMessage(String content) async {
    final String messageDocId = await _chatRepository.create(
      chatMessage: state.chatMessage.copyWith(
        content: content,
      ),
    );
    emit(
      state.copyWith(
        sendedMessageId: messageDocId,
      ),
    );
  }

  // Future<void> getMessageBubbleSize(double messageBubbleHeight) async {
  //   emit(state.copyWith(
  //     messageBubbleHeight: messageBubbleHeight,
  //   ));
  // }

  @override
  Future<void> close() async {
    await _messageListSubscription?.cancel();
    return super.close();
  }
}
