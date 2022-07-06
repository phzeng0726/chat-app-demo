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
    Either<HomeFailure, String> failureOrFileURL;
    emit(
      state.copyWith(
        isUploadingImage: true,
      ),
    );
    failureOrFileURL = await _homeRepository.uploadImage(
      userId: userId,
      inputSource: 'camera',
    );

    failureOrFileURL.fold(
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
    Either<HomeFailure, String> failureOrFileURL;
    emit(
      state.copyWith(
        isUploadingImage: true,
      ),
    );
    failureOrFileURL = await _homeRepository.uploadImage(
      userId: userId,
      inputSource: 'gallery',
    );

    failureOrFileURL.fold(
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
    Option<HomeFailure> failureOption;

    emit(
      state.copyWith(
        isUpdating: true,
      ),
    );

    failureOption = await _homeRepository.updateUserProfile(
      user: state.user,
    );
    failureOption.fold(
      () => emit(
        state.copyWith(
          failureOption: none(),
          isUpdating: false,
        ),
      ),
      (f) => emit(
        state.copyWith(
          failureOption: some(f),
          isUpdating: false,
        ),
      ),
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
