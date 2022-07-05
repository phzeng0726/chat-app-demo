import 'dart:async';

import 'package:chat_app_demo/domain/auth/user.dart';
import 'package:dartz/dartz.dart';

import '../auth/auth_failure.dart';

abstract class IUserProfileRepository {
  // NOTE: upload image
  Future<String> uploadImage({
    required String userId,
    required String inputSource,
  });
  Future<List<Map<String, dynamic>>> loadImageList();
  Future<void> deleteImage(String ref);

  // NOTE: Firestore 區
  Future<void> update({
    required User user,
  });

  // Stream<Either<AuthFailure, User>> watchUserData({
  //   required String userId,
  // });
}
