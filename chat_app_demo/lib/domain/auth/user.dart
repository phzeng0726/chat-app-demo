import 'package:chat_app_demo/domain/core/device_time_stamp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String userId, // unique key
    required String emailAddress, // 電子信箱
    required String userName,
    required String phoneNumber,
    required DeviceTimeStamp createdTimeStamp,
    required DeviceTimeStamp lastSignInTimeStamp,
  }) = _User;

  factory User.empty() {
    final initTimeStamp = DeviceTimeStamp.initial();
    return User(
      userId: '',
      emailAddress: '',
      userName: '',
      phoneNumber: '',
      createdTimeStamp: initTimeStamp,
      lastSignInTimeStamp: initTimeStamp,
    );
  }
}
