import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart'; // 為了使用 onErrorReturnWith

import '../../domain/auth/auth_failure.dart';
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

  // Stream<Either<ChatFailure, List<ChatMessage>>> watchChatMessageList();

  // Future<void> create({
  //   required ChatMessage chatMessage,
  // });
  // Future<void> update({
  //   required ChatMessage chatMessage,
  // });
  // Future<void> delete({
  //   required String chatMessageId,
  // });

  @override
  Stream<Either<ChatFailure, List<ChatMessage>>> watchChatMessageList({
    required String fromId,
    required String toId,
  }) async* {
    final groupChatDoc = await _firestore.groupChatDocument(
      fromId: fromId,
      toId: toId,
    );
    // final messageListCollection = _firestore.messageListCollection;
    yield* groupChatDoc.messageListCollection
        .orderBy('createdTimeStamp', descending: true)
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
  Future<void> create({
    required ChatMessage chatMessage,
  }) async {
    // NOTE: 將帳號資訊放入firestore裡的userList裡
    final groupChatDoc = await _firestore.groupChatDocument(
      fromId: chatMessage.fromId,
      toId: chatMessage.toId,
    );
    await groupChatDoc
        .messageListCollection
        .doc()
        .set(
          ChatMessageDto.fromDomain(
            chatMessage.copyWith(
              createdTimeStamp: DeviceTimeStamp.now(),
            ),
          ).toJson(),
        );

    return;
  }

  @override
  Future<void> update({
    required ChatMessage chatMessage,
  }) async {
    // NOTE: 將帳號資訊放入firestore裡的userList裡
    final userDoc = await _firestore.userDocument();
    await userDoc.chatListCollection.doc().set(
          ChatMessageDto.fromDomain(chatMessage).toJson(),
        );

    return;
  }

  @override
  Future<void> delete({
    required String chatMessageId,
  }) async {
    // NOTE: 將帳號資訊放入firestore裡的userList裡
    final userDoc = await _firestore.userDocument();

    await userDoc.chatListCollection.doc(chatMessageId).delete();

    return;
  }

  @override
  Stream<Either<AuthFailure, List<User>>> searchUsers({
    required String emailAddress,
  }) async* {
    final userListCollection = _firestore.userListCollection;
    yield* userListCollection
        .where('emailAddress', isEqualTo: emailAddress)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return right<AuthFailure, List<User>>(
            UserListDto.fromFirestore(snapshot).toDomain());
      } else {
        return left(const AuthFailure.unexpected());
      }
    })
      ..onErrorReturnWith((e, stackTrace) {
        LoggerService.simple.i(e);
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const AuthFailure.insufficientPermission());
        } else {
          return left(const AuthFailure.unexpected());
        }
      });
    // yield userListCollection
    //     .where('emailAddress', isEqualTo: emailAddress)
    //     .get()
    //     .then(
    //       (doc) => right<AuthFailure, List<User>>(
    //           UserListDto.fromFirestore(doc).toDomain()),
    //     )
    //     .onErrorReturnWith((e, stackTrace) {
    //   LoggerService.simple.i(e);
    //   if (e is FirebaseException && e.code == 'permission-denied') {
    //     return left(const AuthFailure.insufficientPermission());
    //   } else {
    //     return left(const AuthFailure.unexpected());
    //   }
    // });
  }
}
