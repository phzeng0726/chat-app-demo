import 'dart:async';

import 'package:chat_app_demo/domain/chat/chat_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../domain/auth/user.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/load_status.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IChatRepository _chatRepository;
  HomeCubit(this._chatRepository) : super(HomeState.initial());

  StreamSubscription<Either<ChatFailure, List<User>>>? _userListSubscription;
  StreamSubscription<Either<ChatFailure, User>>? _userSubscription;
  
  Future<void> watchUserStarted() async {
    await _userSubscription?.cancel();
    _userSubscription = _chatRepository
        .watchUser()
        .listen((failureOrUser) => uesrReceived(failureOrUser));
  }

  void uesrReceived(
    Either<ChatFailure, User> failureOrUser,
  ) async {
    failureOrUser.fold(
      (f) => null,
      (user) => fetchFriendListStarted(user: user),
    );
  }

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
        ),
      ),
      (userList) => emit(
        state.copyWith(
          friendListLoadStatus: const LoadStatus.succeed(),
          friendList: userList,
        ),
      ),
    );
    // print(1);
    // await _friendListSubscription?.cancel();
    // _friendListSubscription = _chatRepository
    //     .fetchFriendList()
    //     .listen((failureOrUserList) => friendListReceived(failureOrUserList));
  }

  void friendListReceived(
    Either<ChatFailure, List<User>> failureOrUserList,
  ) async {
    failureOrUserList.fold(
      (f) => emit(
        state.copyWith(
          friendListLoadStatus: const LoadStatus.failed(),
        ),
      ),
      (userList) => emit(
        state.copyWith(
          friendListLoadStatus: const LoadStatus.succeed(),
          friendList: userList,
        ),
      ),
    );
  }

  void searchUserChanged(String emailAddress) {
    emit(
      state.copyWith(
        emailAddress: emailAddress,
      ),
    );
  }

  Future<void> searchUserStarted() async {
    emit(
      state.copyWith(
        searchStatus: const LoadStatus.inProgress(),
      ),
    );

    await _userListSubscription?.cancel();
    _userListSubscription =
        _chatRepository.searchUsers(emailAddress: state.emailAddress).listen(
              (failureOrUserList) => userListReceived(failureOrUserList),
            );
  }

  void userListReceived(
    Either<ChatFailure, List<User>> failureOrUserList,
  ) async {
    failureOrUserList.fold(
      (f) => emit(
        state.copyWith(
          searchStatus: const LoadStatus.failed(),
        ),
      ),
      (userList) => emit(
        state.copyWith(
          searchStatus: const LoadStatus.succeed(),
          searchUserList: userList,
        ),
      ),
    );
  }

  void inviteFriendPressed({required String otherUserId}) {
    _chatRepository.inviteFriend(otherUserId: otherUserId);
  }

  @override
  Future<void> close() async {
    await _userListSubscription?.cancel();
    return super.close();
  }
}
