import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';
import '../../domain/core/logger.dart';
import 'firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final auth.FirebaseAuth _firebaseAuth;

  AuthFacade(
    this._firebaseAuth,
  );

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Either<AuthFailure, String>> register(
      {required String emailAddress, required String password}) async {
    try {
      // NOTE firebase_auth新增User帳號，如果email已經存在的話會擋
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return right(credential.user!.uid);
    } on auth.FirebaseAuthException catch (e) {
      LoggerService.simple.i(e.code);
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAddressAlreadyInUse());
      } else if (e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmail());
      } else if (e.code == 'weak-password') {
        return left(const AuthFailure.weakPassword());
      } else if (e.code == 'unknown') {
        return left(const AuthFailure.unexpected());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, String>> signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return right(credential.user!.uid);
    } on auth.FirebaseAuthException catch (e) {
      // PlatformException
      LoggerService.simple.i(e.code);
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmailAndPassword());
      } else if (e.code == 'unknown') {
        return left(const AuthFailure.unexpected());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
