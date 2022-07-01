import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/domain/auth/user.dart';
import 'package:chat_app_demo/domain/chat/i_chat_repository.dart';
import 'package:chat_app_demo/domain/core/load_status.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_failure.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final IChatRepository _chatRepository;
  HomeCubit(this._chatRepository) : super(HomeState.initial());

  StreamSubscription<Either<AuthFailure, List<User>>>? _userListSubscription;

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
    Either<AuthFailure, List<User>> failureOrUserList,
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

  @override
  Future<void> close() async {
    await _userListSubscription?.cancel();
    return super.close();
  }
}
