import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/user.dart';
import '../../domain/chat/chat_failure.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/load_status.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IChatRepository _chatRepository;
  HomeCubit(this._chatRepository) : super(HomeState.initial());

  StreamSubscription<Either<ChatFailure, List<User>>>? _userListSubscription;

  Future<void> fetchFriendListStarted({
    required User user,
  }) async {
    Either<ChatFailure, List<User>> failureOrUserList;
    emit(
      state.copyWith(
        friendListLoadStatus: const LoadStatus.inProgress(),
      ),
    );
    failureOrUserList = await _chatRepository.fetchFriendList(user: user);

    failureOrUserList.fold(
      (f) => emit(
        state.copyWith(
          friendListLoadStatus: const LoadStatus.failed(),
          chatFailureOption: some(f),
        ),
      ),
      (userList) => emit(
        state.copyWith(
          friendListLoadStatus: const LoadStatus.succeed(),
          friendList: userList,
          chatFailureOption: none(),
        ),
      ),
    );
  }

  void searchUserChanged(String emailAddress) {
    emit(
      state.copyWith(
        emailAddress: emailAddress,
        chatFailureOption: none(),
      ),
    );
  }

  Future<void> searchUserStarted() async {
    Either<ChatFailure, List<User>> failureOrUserList;

    emit(
      state.copyWith(
        searchStatus: const LoadStatus.inProgress(),
      ),
    );
    failureOrUserList = await _chatRepository.searchUserEmailAddress(
        emailAddress: state.emailAddress);

    failureOrUserList.fold(
      (f) => emit(
        state.copyWith(
          chatFailureOption: some(f),
          searchStatus: const LoadStatus.failed(),
        ),
      ),
      (userList) => emit(
        state.copyWith(
          chatFailureOption: none(),
          searchStatus: const LoadStatus.succeed(),
          searchedUserList: userList,
        ),
      ),
    );
    // await _userListSubscription?.cancel();
    // _userListSubscription =
    //     _chatRepository.searchUsers(emailAddress: state.emailAddress).listen(
    //           (failureOrUserList) => userListReceived(
    //             failureOrUserList,
    //           ),
    //         );
  }

  // void userListReceived(failureOrUserList) async {
  //   failureOrUserList.fold(
  //     (f) => emit(
  //       state.copyWith(
  //         searchStatus: const LoadStatus.failed(),
  //       ),
  //     ),
  //     (userList) => emit(
  //       state.copyWith(
  //         searchStatus: const LoadStatus.succeed(),
  //         searchUserList: userList,
  //       ),
  //     ),
  //   );
  // }

  void inviteFriendPressed({required String otherUserId}) {
    _chatRepository.inviteFriend(otherUserId: otherUserId);
  }

  @override
  Future<void> close() async {
    await _userListSubscription?.cancel();
    return super.close();
  }
}
