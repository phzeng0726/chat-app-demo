import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/user.dart';
import '../../domain/home/home_failure.dart';
import '../../domain/home/i_home_repository.dart';

part 'user_profile_edit_cubit.freezed.dart';
part 'user_profile_edit_state.dart';

class UserProfileEditCubit extends Cubit<UserProfileEditState> {
  final IHomeRepository _homeRepository;
  UserProfileEditCubit(
    this._homeRepository,
  ) : super(UserProfileEditState.initial());

  void init({required User user}) {
    emit(
      state.copyWith(
        user: user,
      ),
    );
  }

  void cameraButtonPressed({
    required String userId,
  }) async {
    Either<HomeFailure, String> failureOrFileUrl;
    emit(
      state.copyWith(
        isUploadingImage: true,
      ),
    );
    failureOrFileUrl = await _homeRepository.uploadImage(
      userId: userId,
      inputSource: 'camera',
    );

    failureOrFileUrl.fold(
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          isUploadingImage: false,
        ),
      ),
      (fileUrl) async {
        emit(
          state.copyWith(
            failureOption: none(),
            isUploadingImage: false,
            user: state.user.copyWith(
              imageUrl: fileUrl,
            ),
          ),
        );

        await updateUserProfile();
      },
    );
  }

  void galleryButtonPressed({
    required String userId,
  }) async {
    Either<HomeFailure, String> failureOrFileUrl;
    emit(
      state.copyWith(
        isUploadingImage: true,
      ),
    );
    failureOrFileUrl = await _homeRepository.uploadImage(
      userId: userId,
      inputSource: 'gallery',
    );

    failureOrFileUrl.fold(
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          isUploadingImage: false,
        ),
      ),
      (fileUrl) async {
        emit(
          state.copyWith(
            failureOption: none(),
            isUploadingImage: false,
            user: state.user.copyWith(
              imageUrl: fileUrl,
            ),
          ),
        );

        await updateUserProfile();
      },
    );
  }

  void userNameChanged(String userName) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          userName: userName,
        ),
      ),
    );
  }

  void aboutMeChanged(String aboutMe) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          aboutMe: aboutMe,
        ),
      ),
    );
  }

  Future<void> updateUserProfile() async {
    Either<HomeFailure, String> failureOrUserIdOption;
    emit(
      state.copyWith(
        isUpdating: true,
      ),
    );

    failureOrUserIdOption = await _homeRepository.updateUserProfile(
      user: state.user,
    );
    failureOrUserIdOption.fold(
      (f) => state.copyWith(
        isUpdating: false,
        failureOption: some(f),
      ),
      (_) => emit(
        state.copyWith(
          isUpdating: false,
          failureOption: none(),
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
