import 'dart:async';

import 'user.dart';
import 'package:dartz/dartz.dart';

import 'auth_failure.dart';

// NOTE: 抽象定義 auth 的資料動作
abstract class IAuthFacade {
  // sign in
  Future<Option<String>> getSignedInUserId();

  Future<Either<AuthFailure, String>> signIn({
    required String emailAddress,
    required String password,
  });

  Future<Either<AuthFailure, String>> register({
    required String emailAddress,
    required String password,
  });

  // sign out
  Future<void> signOut();

  // NOTE: Firestore 區
  Future<Either<AuthFailure, String>> createUserDoc({
    required User user,
  });
  
  Stream<Either<AuthFailure, User>> watchUserData({
    required String userId,
  });
}
