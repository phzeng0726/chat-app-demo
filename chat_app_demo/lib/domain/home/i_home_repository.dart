import 'dart:async';

import 'package:dartz/dartz.dart';

import '../auth/user.dart';
import 'home_failure.dart';

abstract class IHomeRepository {
  Future<Either<HomeFailure, List<User>>> fetchFriendList({
    required User user,
  });

  Future<Either<HomeFailure, List<User>>> searchUserEmailAddress({
    required String emailAddress,
  });

  Stream<Either<HomeFailure, List<String>>> watchGroupChat({
    required String userId,
  });

  Future<void> inviteFriend({
    required String otherUserId,
  });
}
