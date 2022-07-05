import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

import '../../domain/auth/user.dart';
import '../../domain/chat/chat_failure.dart';
import '../../domain/core/logger.dart';
import '../../domain/user_profile/i_user_profile_repository.dart';
import '../auth/user_dtos.dart';
import '../core/firebase_helper.dart';

@LazySingleton(as: IUserProfileRepository)
class UserProfileRepository implements IUserProfileRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UserProfileRepository(
    this._firestore,
    this._storage,
  );

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
      } on FirebaseException catch (e) {
        LoggerService.simple.i(e);
        return left(const ChatFailure.insufficientPermission());
      }
    } catch (e) {
      LoggerService.simple.i(e);
      return left(const ChatFailure.unexpected());
    }
  }

  @override
  Future<void> update({
    required User user,
  }) async {
    final userDoc = await _firestore.userDocument();
    await userDoc.set(
      UserDto.fromDomain(user).toJson(),
      SetOptions(merge: true),
    );

    return;
  }
}
