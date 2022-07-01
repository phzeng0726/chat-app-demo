import 'dart:async';

import 'package:chat_app_demo/domain/auth/user.dart';
import 'package:chat_app_demo/domain/chat/chat_failure.dart';
import 'package:chat_app_demo/domain/chat/chat_message.dart';
import 'package:dartz/dartz.dart';

import '../auth/auth_failure.dart';

// NOTE: 抽象定義 auth 的資料動作
abstract class IChatRepository {
  // // NOTE: Firestore 區
  Stream<Either<AuthFailure, List<User>>> searchUsers({
    required String emailAddress,
  });
  Stream<Either<ChatFailure, List<ChatMessage>>> watchChatMessageList({
    required String fromId,
    required String toId,
  });

  Future<void> create({
    required ChatMessage chatMessage,
  });
  Future<void> update({
    required ChatMessage chatMessage,
  });
  Future<void> delete({
    required String chatMessageId,
  });
}
