import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart'; // 為了使用 onErrorReturnWith

import '../../domain/auth/user.dart';
import '../../domain/chat/chat_failure.dart';
import '../../domain/chat/chat_message.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/device_time_stamp.dart';
import '../../domain/core/logger.dart';
import '../auth/user_dtos.dart';
import '../core/firebase_helper.dart';
import 'chat_message_dtos.dart';

@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final FirebaseFirestore _firestore;

  ChatRepository(
    this._firestore,
  );

  @override
  Future<Either<ChatFailure, List<User>>> fetchFriendList(
      {required User user}) async {
    final userListCollection = _firestore.userListCollection;
    try {
      if (user.friendIdList.isNotEmpty) {
        return userListCollection
            .where('userId', whereIn: user.friendIdList)
            .get()
            .then((value) => right<ChatFailure, List<User>>(
                UserListDto.fromFirestore(value).toDomain()));
      } else {
        return right<ChatFailure, List<User>>(<User>[]);
      }
    } catch (e) {
      LoggerService.simple.i(e);
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const ChatFailure.insufficientPermission());
      } else {
        return left(const ChatFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<ChatFailure, List<User>>> searchUserEmailAddress({
    required String emailAddress,
  }) async {
    final userListCollection = _firestore.userListCollection;
    final QuerySnapshot<Object?> query = await userListCollection
        .where('emailAddress', isEqualTo: emailAddress)
        .get();

    try {
      if (query.size >= 1) {
        return right<ChatFailure, List<User>>(
            UserListDto.fromFirestore(query).toDomain());
      } else {
        return left(const ChatFailure.userNotExist());
      }
    } catch (e) {
      LoggerService.simple.i(e);
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const ChatFailure.insufficientPermission());
      } else {
        return left(const ChatFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<ChatFailure, List<ChatMessage>>> watchMessageList({
    required String fromId,
    required String toId,
  }) async* {
    final groupChatDoc = await _firestore.groupChatDocument(
      fromId: fromId,
      toId: toId,
    );
    yield* groupChatDoc.messageListCollection
        .orderBy('createdTimeStamp')
        .snapshots()
        .map((snapshot) => right<ChatFailure, List<ChatMessage>>(
            ChatMessageListDto.fromFirestore(snapshot).toDomain()))
      ..onErrorReturnWith((e, stackTrace) {
        LoggerService.simple.i(e);
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const ChatFailure.insufficientPermission());
        } else {
          return left(const ChatFailure.unexpected());
        }
      });
  }

  @override
  Future<String> create({
    required ChatMessage chatMessage,
  }) async {
    final groupChatDoc = await _firestore.groupChatDocument(
      fromId: chatMessage.fromId,
      toId: chatMessage.toId,
    );

    final messageDoc = groupChatDoc.messageListCollection.doc();
    await messageDoc.set(
      ChatMessageDto.fromDomain(
        chatMessage.copyWith(
          createdTimeStamp: DeviceTimeStamp.now(),
        ),
      ).toJson(),
    );

    return messageDoc.id;
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

  @override
  Future<void> update({
    required ChatMessage chatMessage,
  }) async {
    final userDoc = await _firestore.userDocument();
    // await userDoc.chatListCollection.doc().set(
    //       ChatMessageDto.fromDomain(chatMessage).toJson(),
    //     );

    return;
  }

  @override
  Future<void> delete({
    required String chatMessageId,
  }) async {
    final userDoc = await _firestore.userDocument();

    // await userDoc.chatListCollection.doc(chatMessageId).delete();

    return;
  }

  @override
  Stream<Either<ChatFailure, List<String>>> watchGroupChat({
    required String userId,
  }) async* {
    final chatListCollection = _firestore.chatListCollection;
    yield* chatListCollection
        .where(chatListCollection.id, arrayContains: userId)
        .snapshots()
        .map((snapshot) =>
            right<ChatFailure, List<String>>([snapshot.toString()]))
      ..onErrorReturnWith((e, stackTrace) {
        LoggerService.simple.i(e);
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const ChatFailure.insufficientPermission());
        } else {
          return left(const ChatFailure.unexpected());
        }
      });
  }
}
