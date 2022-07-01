// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserListDto _$$_UserListDtoFromJson(Map<String, dynamic> json) =>
    _$_UserListDto(
      list: (json['list'] as List<dynamic>)
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserListDtoToJson(_$_UserListDto instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      userId: json['userId'] as String,
      emailAddress: json['emailAddress'] as String,
      userName: json['userName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      createdTimeStamp: json['createdTimeStamp'] as int,
      lastSignInTimeStamp: json['lastSignInTimeStamp'] as int,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'emailAddress': instance.emailAddress,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'createdTimeStamp': instance.createdTimeStamp,
      'lastSignInTimeStamp': instance.lastSignInTimeStamp,
    };
