import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
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
  final FirebaseStorage _storage;

  HomeRepository(
    this._firestore,
    this._storage,
  );

  @override
  Stream<Either<HomeFailure, List<User>>> watchFriendList({
    required User user,
  }) async* {
    final userListCollection = _firestore.userListCollection;

    yield* userListCollection
        .where('friendIdList', arrayContains: user.userId)
        .snapshots()
        .map((snapshot) => right<HomeFailure, List<User>>(
            UserListDto.fromFirestore(snapshot).toDomain()))
      ..onErrorReturnWith((e, stackTrace) {
        LoggerService.simple.i('[HomeRepository] $e');
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const HomeFailure.insufficientPermission());
        } else {
          return left(const HomeFailure.unexpected());
        }
      });
    // NOTE: 如果好友的狀態改變，會沒辦法及時更新，所以本來用future，後來改stream
    // try {
    //   if (user.friendIdList.isNotEmpty) {
    //     return userListCollection
    //         .where('userId', whereIn: user.friendIdList)
    //         .get()
    //         .then((value) => right<HomeFailure, List<User>>(
    //             UserListDto.fromFirestore(value).toDomain()));
    //   } else {
    //     return right<HomeFailure, List<User>>(<User>[]);
    //   }
    // } catch (e) {
    //   LoggerService.simple.i('[HomeRepository] $e');
    //   if (e is FirebaseException && e.code == 'permission-denied') {
    //     return left(const HomeFailure.insufficientPermission());
    //   } else {
    //     return left(const HomeFailure.unexpected());
    //   }
    // }
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
      LoggerService.simple.i('[HomeRepository] $e');
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
        LoggerService.simple.i('[HomeRepository] $e');
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const HomeFailure.insufficientPermission());
        } else {
          return left(const HomeFailure.unexpected());
        }
      });
  }

  @override
  Future<Either<HomeFailure, String>> uploadImage({
    required String userId,
    required String inputSource,
  }) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        Reference fileRef = _storage.ref(fileName);
        await fileRef.putFile(
          imageFile,
          SettableMetadata(
            customMetadata: {
              'userId': userId,
            },
          ),
        );
        String fileUrl = await fileRef.getDownloadURL();
        return right(fileUrl);
      } catch (e) {
        LoggerService.simple.i('[HomeRepository] $e');
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const HomeFailure.insufficientPermission());
        } else {
          return left(const HomeFailure.unexpected());
        }
      }
    } catch (e) {
      LoggerService.simple.i('[HomeRepository] $e');
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const HomeFailure.insufficientPermission());
      } else {
        return left(const HomeFailure.unexpected());
      }
    }
  }

  @override
  Future<Option<HomeFailure>> inviteFriend({
    required String otherUserId,
  }) async {
    try {
      final userDoc = await _firestore.userDocument();
      final user = await userDoc.get().then(
            (doc) => UserDto.fromFirestore(doc).toDomain(),
          );
      final friendIdList = user.friendIdList;
      friendIdList.add(otherUserId);

      final otherUserDoc = _firestore.userListCollection.doc(otherUserId);
      final otherUser = await otherUserDoc.get().then(
            (doc) => UserDto.fromFirestore(doc).toDomain(),
          );
      final otherFriendIdList = otherUser.friendIdList;
      otherFriendIdList.add(user.userId);

      await userDoc.update(
          UserDto.fromDomain(user.copyWith(friendIdList: friendIdList))
              .toJson());

      await otherUserDoc.update(UserDto.fromDomain(
              otherUser.copyWith(friendIdList: otherFriendIdList))
          .toJson());

      return none();
    } catch (e) {
      LoggerService.simple.i('[HomeRepository] $e');
      if (e is FirebaseException && e.code == 'permission-denied') {
        return some(const HomeFailure.insufficientPermission());
      } else {
        return some(const HomeFailure.unexpected());
      }
    }
  }

  @override
  Future<Option<HomeFailure>> updateUserProfile({
    required User user,
  }) async {
    try {
      final userDoc = await _firestore.userDocument();
      await userDoc.update(
        UserDto.fromDomain(user).toJson(),
      );

      return none();
    } catch (e) {
      LoggerService.simple.i('[HomeRepository] $e');
      if (e is FirebaseException && e.code == 'permission-denied') {
        return some(const HomeFailure.insufficientPermission());
      } else {
        return some(const HomeFailure.unexpected());
      }
    }
  }
}
