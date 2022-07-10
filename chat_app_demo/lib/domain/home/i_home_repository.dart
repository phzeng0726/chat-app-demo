import 'dart:async';

import 'package:dartz/dartz.dart';

import '../auth/user.dart';
import 'home_failure.dart';

abstract class IHomeRepository {
  Stream<Either<HomeFailure, List<User>>> watchFriendList({
    required User user,
  });

  Future<Either<HomeFailure, List<User>>> searchUserEmailAddress({
    required String emailAddress,
  });

  Stream<Either<HomeFailure, List<String>>> watchGroupChat({
    required String userId,
  });
  
  Future<Either<HomeFailure, String>> uploadImage({
    required String userId,
    required String inputSource,
  });

  Future<Option<HomeFailure>> inviteFriend({
    required String otherUserId,
  });

  Future<Option<HomeFailure>> updateUserProfile({
    required User user,
  });
}
