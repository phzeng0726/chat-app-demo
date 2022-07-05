import 'dart:async';

import 'package:dartz/dartz.dart';

import 'chat_failure.dart';
import 'chat_message.dart';

abstract class IChatRepository {
  Stream<Either<ChatFailure, List<ChatMessage>>> watchMessageList({
    required String currentUserId,
    required String otherUserId,
  });

  Future<Either<ChatFailure, String>> create({
    required ChatMessage chatMessage,
  });
  // Future<void> update({
  //   required ChatMessage chatMessage,
  // });
  // Future<void> delete({
  //   required String chatMessageId,
  // });
}
