import 'dart:async';

import 'package:chat_app_demo/domain/chat/chat_failure.dart';
import 'package:dartz/dartz.dart';

import '../auth/user.dart';

abstract class IUserProfileRepository {
  // NOTE: upload image
  Future<Either<ChatFailure, String>> uploadImage({
    required String userId,
    required String inputSource,
  });

  // NOTE: Firestore 區
  Future<void> update({
    required User user,
  });
}
