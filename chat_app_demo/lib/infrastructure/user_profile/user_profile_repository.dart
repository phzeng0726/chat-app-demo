import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;

import '../../domain/auth/user.dart';
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
  Future<String> uploadImage({
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
        return fileUrl;
      } on FirebaseException catch (e) {
        LoggerService.simple.i(e);
        return '';
      }
    } catch (e) {
      LoggerService.simple.i(e);
      return '';
    }
  }

  @override
  Future<List<Map<String, dynamic>>> loadImageList() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await _storage.ref().list();
    final List<Reference> allFiles = result.items;

    // List<Map<String, dynamic>> files = allFiles.map((file) async {
    //   final String fileUrl = await file.getDownloadURL();
    //   return file.getMetadata().then((value) => {
    //     "url": fileUrl,
    //     "path": file.fullPath,
    //     "userId": value.customMetadata?['userId'] ?? '',
    //   });
    // }).toList();
    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "userId": fileMeta.customMetadata?['userId'] ?? '',
      });
    });

    return files;
  }

  @override
  Future<void> deleteImage(String ref) async {
    await _storage.ref(ref).delete();
    return;
  }

  @override
  Future<void> update({
    required User user,
  }) async {
    final userDoc = await _firestore.userDocument();
    await userDoc.update(UserDto.fromDomain(user).toJson());

    return;
  }
}
