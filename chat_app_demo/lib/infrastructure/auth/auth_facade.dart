import 'dart:async';

import 'package:chat_app_demo/domain/core/device_time_stamp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart'; // 為了使用 onErrorReturnWith

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';
import '../../domain/core/logger.dart';
import '../core/firebase_helper.dart';
import 'user_dtos.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthFacade(
    this._firebaseAuth,
    this._firestore,
  );

  @override
  Future<Option<String>> getSignedInUserId() async =>
      optionOf(_firebaseAuth.currentUser?.uid);

  @override
  Future<Either<AuthFailure, String>> register({
    required String emailAddress,
    required String password,
  }) async {
    try {
      // NOTE firebase_auth新增User帳號，如果email已經存在的話會擋
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = User(
        userId: credential.user!.uid,
        emailAddress: emailAddress,
        userName: credential.user!.displayName ?? emailAddress,
        phoneNumber: credential.user!.phoneNumber ?? '',
        createdTimeStamp:
            DeviceTimeStamp(credential.user!.metadata.creationTime!),
        lastSignInTimeStamp:
            DeviceTimeStamp(credential.user!.metadata.lastSignInTime!),
        friendIdList: <String>[],
      );

      await createUserDoc(
        user: user,
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

  @override
  Future<void> createUserDoc({
    required User user,
  }) async {
    // NOTE: 將帳號資訊放入firestore裡的userList裡
    final userDoc = await _firestore.userDocument();
    await userDoc.set(UserDto.fromDomain(user).toJson());

    return;
  }

  @override
  Stream<Either<AuthFailure, User>> watchUserData({
    required String userId,
  }) async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc
        .snapshots()
        .map(
          (doc) =>
              right<AuthFailure, User>(UserDto.fromFirestore(doc).toDomain()),
        )
        .onErrorReturnWith((e, stackTrace) {
      LoggerService.simple.i(e);
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    });
  }
}
