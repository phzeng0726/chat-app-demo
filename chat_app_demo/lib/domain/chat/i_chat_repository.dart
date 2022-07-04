import 'dart:async';

import 'package:dartz/dartz.dart';

import '../auth/user.dart';
import 'chat_failure.dart';
import 'chat_message.dart';

abstract class IChatRepository {
  Future<Either<ChatFailure, List<User>>> fetchFriendList({required User user});

  Future<Either<ChatFailure, List<User>>> searchUserEmailAddress({
    required String emailAddress,
  });

  Stream<Either<ChatFailure, List<String>>> watchGroupChat({
    required String userId,
  });

  Future<void> inviteFriend({
    required String otherUserId,
  });

  // message
  Stream<Either<ChatFailure, List<ChatMessage>>> watchMessageList({
    required String fromId,
    required String toId,
  });

  Future<String> create({
    required ChatMessage chatMessage,
  });
  Future<void> update({
    required ChatMessage chatMessage,
  });
  Future<void> delete({
    required String chatMessageId,
  });
}
