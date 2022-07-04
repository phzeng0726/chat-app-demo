import 'dart:async';

import 'package:chat_app_demo/domain/auth/user.dart';
import 'package:dartz/dartz.dart';

import 'auth_failure.dart';

// NOTE: 抽象定義 auth 的資料動作
abstract class IUserProfileRepository {

// upload photo
  // NOTE: Firestore 區
  Future<void> update({
    required User user,
  });
  
  // Stream<Either<AuthFailure, User>> watchUserData({
  //   required String userId,
  // });
}
