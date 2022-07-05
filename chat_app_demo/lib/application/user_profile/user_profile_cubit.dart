import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_profile/i_user_profile_repository.dart';
import '../../domain/auth/user.dart';
import '../../domain/core/load_status.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final IUserProfileRepository _userProfileRepository;
  UserProfileCubit(
    this._userProfileRepository,
  ) : super(UserProfileState.initial());

  // init user profile
  // edit imageUrl
  void init({
    required User user,
  }) {
    emit(
      state.copyWith(
        user: user,
      ),
    );
  }

  void cameraButtonPressed({
    required String userId,
  }) async {
    String fileUrl = await _userProfileRepository.uploadImage(
      userId: userId,
      inputSource: 'camera',
    );
    emit(state.copyWith(
        user: state.user.copyWith(
      imageUrl: fileUrl,
    )));

    await _userProfileRepository.update(
      user: state.user,
    );
  }

  void galleryButtonPressed({
    required String userId,
  }) {
    _userProfileRepository.uploadImage(
      userId: userId,
      inputSource: 'gallery',
    );
  }
  // edit userName

  void userNameChanged(String userName) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          userName: userName,
        ),
      ),
    );
  }

  // edit aboutMe
  void aboutMeChanged(String aboutMe) {
    emit(
      state.copyWith(
        user: state.user.copyWith(
          aboutMe: aboutMe,
        ),
      ),
    );
  }

  // update user profile
  Future<void> updateUserProfilePressed() async {
    emit(
      state.copyWith(
        isUpdating: true,
      ),
    );

    await _userProfileRepository.update(user: state.user);

    emit(
      state.copyWith(
        isUpdating: false,
      ),
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
