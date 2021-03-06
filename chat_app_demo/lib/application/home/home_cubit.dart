import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/user.dart';
import '../../domain/core/load_status.dart';
import '../../domain/home/home_failure.dart';
import '../../domain/home/i_home_repository.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(HomeState.initial());

  StreamSubscription<Either<HomeFailure, List<User>>>? _userListSubscription;

  void init({required User user}) async {
    emit(
      state.copyWith(
        user: user,
      ),
    );
    await _userListSubscription?.cancel();
    _userListSubscription = _homeRepository
        .watchFriendList(
          user: user,
        )
        .listen(
          (failureOrUserList) => userListReceived(failureOrUserList),
        );
  }

  // Future<void> watchFriendListStarted({
  //   required User user,
  // }) async {
  //   // Either<HomeFailure, List<User>> failureOrUserList;
  //   // emit(
  //   //   state.copyWith(
  //   //     friendListLoadStatus: const LoadStatus.inProgress(),
  //   //   ),
  //   // );
  //   // failureOrUserList = await _homeRepository.fetchFriendList(
  //   //   user: user,
  //   // );

  //   // failureOrUserList.fold(
  //   //   (f) => emit(
  //   //     state.copyWith(
  //   //       friendListLoadStatus: const LoadStatus.failed(),
  //   //       failureOption: some(f),
  //   //     ),
  //   //   ),
  //   //   (userList) => emit(
  //   //     state.copyWith(
  //   //       friendListLoadStatus: const LoadStatus.succeed(),
  //   //       friendList: userList,
  //   //       failureOption: none(),
  //   //     ),
  //   //   ),
  //   // );
  // }

  void userListReceived(
    Either<HomeFailure, List<User>> failureOrUserList,
  ) {
    failureOrUserList.fold(
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          friendListLoadStatus: const LoadStatus.failed(),
        ),
      ),
      (userList) => emit(
        state.copyWith(
          friendListLoadStatus: const LoadStatus.succeed(),
          friendList: userList,
          failureOption: none(),
        ),
      ),
    );
  }

  void searchUserChanged(String emailAddress) {
    emit(
      state.copyWith(
        emailAddress: emailAddress,
        failureOption: none(),
      ),
    );
  }

  Future<void> searchUserStarted() async {
    Either<HomeFailure, List<User>> failureOrUserList;

    emit(
      state.copyWith(
        searchStatus: const LoadStatus.inProgress(),
      ),
    );

    failureOrUserList = await _homeRepository.searchUserEmailAddress(
        emailAddress: state.emailAddress);

    failureOrUserList.fold(
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          searchStatus: const LoadStatus.failed(),
        ),
      ),
      (userList) => emit(
        state.copyWith(
          failureOption: none(),
          searchStatus: const LoadStatus.succeed(),
          searchedUserList: userList,
        ),
      ),
    );
  }

  void inviteFriendPressed({
    required String otherUserId,
  }) async {
    final failureOption = await _homeRepository.inviteFriend(
      otherUserId: otherUserId,
    );

    failureOption.fold(
      () => emit(
        state.copyWith(
          failureOption: none(),
        ),
      ),
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _userListSubscription?.cancel();
    return super.close();
  }
}
