import 'dart:async';

import 'package:dartz/dartz.dart';

import 'chat_failure.dart';
import 'chat_message.dart';

abstract class IChatRepository {
  Stream<Either<ChatFailure, List<ChatMessage>>> watchMessageList({
    required String currentUserId,
    required String otherUserId,
  });
  Future<Either<ChatFailure, String>> uploadImage({
    required String userId,
    required String inputSource,
  });
  Future<Either<ChatFailure, String>> create({
    required ChatMessage chatMessage,
  });
}
