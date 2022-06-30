import 'dart:async';

import 'package:dartz/dartz.dart';

import 'auth_failure.dart';
import 'user.dart';

// NOTE: 抽象定義 auth 的資料動作
abstract class IAuthFacade {
  // sign in
  Future<Option<User>> getSignedInUser();

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
}
