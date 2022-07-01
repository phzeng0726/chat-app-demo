import 'package:chat_app_demo/domain/core/device_time_stamp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/user.dart';

part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
class UserListDto with _$UserListDto {
  const UserListDto._();
  const factory UserListDto({
    required List<UserDto> list,
  }) = _UserListDto;

  factory UserListDto.fromDomain(List<User> userList) {
    return UserListDto(
        list: userList.map((user) => UserDto.fromDomain(user)).toList());
  }
  
  List<User> toDomain() {
    return list.map((dto) => dto.toDomain()).toList();
  }

  factory UserListDto.fromJson(Map<String, dynamic> json) =>
      _$UserListDtoFromJson(json);

  factory UserListDto.fromFirestore(QuerySnapshot snapshot) {
    final list = snapshot.docs.map((doc) => doc.data()).toList();
    return UserListDto.fromJson({'list': list});
  }
}

@freezed
class UserDto with _$UserDto {
  const UserDto._();
  const factory UserDto({
    required String userId,
    required String emailAddress,
    required String userName,
    required String phoneNumber,
    required int createdTimeStamp,
    required int lastSignInTimeStamp,
  }) = _UserDto;

  factory UserDto.fromDomain(User user) {
    return UserDto(
      userId: user.userId,
      emailAddress: user.emailAddress,
      userName: user.userName,
      phoneNumber: user.phoneNumber,
      createdTimeStamp: user.createdTimeStamp.value.microsecondsSinceEpoch,
      lastSignInTimeStamp:
          user.lastSignInTimeStamp.value.microsecondsSinceEpoch,
    );
  }

  User toDomain() => User(
        userId: userId,
        emailAddress: emailAddress,
        userName: userName,
        phoneNumber: phoneNumber,
        createdTimeStamp: DeviceTimeStamp.fromInt(createdTimeStamp),
        lastSignInTimeStamp: DeviceTimeStamp.fromInt(lastSignInTimeStamp),
      );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromFirestore(DocumentSnapshot doc) {
    return UserDto.fromJson(doc.data()! as Map<String, dynamic>);
  }
}
