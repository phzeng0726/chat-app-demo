import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/auth/user.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      userId: uid,
      // emailAddress: email!,
      // userName: displayName!,
    );
  }
}