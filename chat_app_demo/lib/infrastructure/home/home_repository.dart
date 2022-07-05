import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart'; // 為了使用 onErrorReturnWith

import '../../domain/auth/user.dart';
import '../../domain/core/logger.dart';
import '../../domain/home/home_failure.dart';
import '../../domain/home/i_home_repository.dart';
import '../auth/user_dtos.dart';
import '../core/firebase_helper.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository implements IHomeRepository {
  final FirebaseFirestore _firestore;

  HomeRepository(
    this._firestore,
  );

  @override
  Future<Either<HomeFailure, List<User>>> fetchFriendList({
    required User user,
  }) async {
    final userListCollection = _firestore.userListCollection;
    try {
      if (user.friendIdList.isNotEmpty) {
        return userListCollection
            .where('userId', whereIn: user.friendIdList)
            .get()
            .then((value) => right<HomeFailure, List<User>>(
                UserListDto.fromFirestore(value).toDomain()));
      } else {
        return right<HomeFailure, List<User>>(<User>[]);
      }
    } catch (e) {
      LoggerService.simple.i(e);
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const HomeFailure.insufficientPermission());
      } else {
        return left(const HomeFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<HomeFailure, List<User>>> searchUserEmailAddress({
    required String emailAddress,
  }) async {
    final userListCollection = _firestore.userListCollection;
    final QuerySnapshot<Object?> query = await userListCollection
        .where('emailAddress', isEqualTo: emailAddress)
        .get();

    try {
      if (query.size >= 1) {
        return right<HomeFailure, List<User>>(
            UserListDto.fromFirestore(query).toDomain());
      } else {
        return left(const HomeFailure.userNotExist());
      }
    } catch (e) {
      LoggerService.simple.i(e);
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const HomeFailure.insufficientPermission());
      } else {
        return left(const HomeFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<HomeFailure, List<String>>> watchGroupChat({
    required String userId,
  }) async* {
    final chatListCollection = _firestore.chatListCollection;
    yield* chatListCollection
        .where(chatListCollection.id, arrayContains: userId)
        .snapshots()
        .map((snapshot) =>
            right<HomeFailure, List<String>>([snapshot.toString()]))
      ..onErrorReturnWith((e, stackTrace) {
        LoggerService.simple.i(e);
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const HomeFailure.insufficientPermission());
        } else {
          return left(const HomeFailure.unexpected());
        }
      });
  }

  @override
  Future<void> inviteFriend({
    required String otherUserId,
  }) async {
    final userDoc = await _firestore.userDocument();
    final user = await userDoc.get().then(
          (doc) => UserDto.fromFirestore(doc).toDomain(),
        );
    final friendIdList = user.friendIdList;
    friendIdList.add(otherUserId);
    await userDoc.update(
        UserDto.fromDomain(user.copyWith(friendIdList: friendIdList)).toJson());

    return;
  }
}
