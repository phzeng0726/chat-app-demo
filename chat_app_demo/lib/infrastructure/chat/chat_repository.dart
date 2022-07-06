import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart'; // 為了使用 onErrorReturnWith

import '../../domain/chat/chat_failure.dart';
import '../../domain/chat/chat_message.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/device_time_stamp.dart';
import '../../domain/core/logger.dart';
import '../core/firebase_helper.dart';
import 'chat_message_dtos.dart';

@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final FirebaseFirestore _firestore;

  ChatRepository(
    this._firestore,
  );

  @override
  Stream<Either<ChatFailure, List<ChatMessage>>> watchMessageList({
    required String currentUserId,
    required String otherUserId,
  }) async* {
    final groupChatDoc = await _firestore.groupChatDocument(
      currentUserId: currentUserId,
      otherUserId: otherUserId,
    );
    yield* groupChatDoc.messageListCollection
        .orderBy('createdTimeStamp')
        .snapshots()
        .map((snapshot) => right<ChatFailure, List<ChatMessage>>(
            ChatMessageListDto.fromFirestore(snapshot).toDomain()))
      ..onErrorReturnWith((e, stackTrace) {
        LoggerService.simple.i('[ChatRepository] $e');
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const ChatFailure.insufficientPermission());
        } else {
          return left(const ChatFailure.unexpected());
        }
      });
  }

  @override
  Future<Either<ChatFailure, String>> create({
    required ChatMessage chatMessage,
  }) async {
    try {
      final groupChatDoc = await _firestore.groupChatDocument(
        currentUserId: chatMessage.fromId,
        otherUserId: chatMessage.toId,
      );

      final messageDoc = groupChatDoc.messageListCollection.doc();

      await messageDoc.set(
        ChatMessageDto.fromDomain(
          chatMessage.copyWith(
            createdTimeStamp: DeviceTimeStamp.now(),
          ),
        ).toJson(),
      );
      return right(messageDoc.id);
    } catch (e) {

      LoggerService.simple.i('[ChatRepository] $e');
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const ChatFailure.insufficientPermission());
      } else {
        return left(const ChatFailure.unexpected());
      }
    }
  }

  // @override
  // Future<void> update({
  //   required ChatMessage chatMessage,
  // }) async {
  //   final userDoc = await _firestore.userDocument();
  //   // await userDoc.chatListCollection.doc().set(
  //   //       ChatMessageDto.fromDomain(chatMessage).toJson(),
  //   //     );

  //   return;
  // }

  // @override
  // Future<void> delete({
  //   required String chatMessageId,
  // }) async {
  //   // final groupChatDoc = await _firestore.groupChatDocument(
  //   //   fromId: chatMessage.fromId,
  //   //   toId: chatMessage.toId,
  //   // );

  //   // await groupChatDoc.messageListCollection.doc(chatMessageId).delete();

  //   return;
  // }
}
