import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

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
  final FirebaseStorage _storage;

  ChatRepository(
    this._firestore,
    this._storage,
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
  // 與 HomeRepository的相同
  @override
  Future<Either<ChatFailure, String>> uploadImage({
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
        LoggerService.simple.i('[ChatRepository] $e');
        if (e is FirebaseException && e.code == 'permission-denied') {
          return left(const ChatFailure.insufficientPermission());
        } else {
          return left(const ChatFailure.unexpected());
        }
      }
    } catch (e) {
      LoggerService.simple.i('[ChatRepository] $e');
      if (e is FirebaseException && e.code == 'permission-denied') {
        return left(const ChatFailure.insufficientPermission());
      } else {
        return left(const ChatFailure.unexpected());
      }
    }
  }
}
