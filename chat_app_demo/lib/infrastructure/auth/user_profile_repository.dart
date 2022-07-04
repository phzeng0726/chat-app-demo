import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/i_user_profile_repository.dart';
import '../../domain/auth/user.dart';
import '../core/firebase_helper.dart';
import 'user_dtos.dart';

@LazySingleton(as: IUserProfileRepository)
class UserProfileRepository implements IUserProfileRepository {
  final FirebaseFirestore _firestore;

  UserProfileRepository(
    this._firestore,
  );

  @override
  Future<void> update({
    required User user,
  }) async {
    final userDoc = await _firestore.userDocument();
    await userDoc.update(UserDto.fromDomain(user).toJson());

    return;
  }
}
