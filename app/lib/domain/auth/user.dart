import '../core/device_time_stamp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User(
      {required String userId, // unique key
      required String emailAddress, // 電子信箱
      required String userName,
      required String phoneNumber,
      required String aboutMe,
      required String imageUrl,
      required DeviceTimeStamp createdTimeStamp,
      required DeviceTimeStamp lastSignInTimeStamp,
      required List<String> friendIdList}) = _User;

  factory User.empty() {
    final initTimeStamp = DeviceTimeStamp.initial();
    return User(
      userId: '',
      emailAddress: '',
      userName: '',
      phoneNumber: '',
      aboutMe: '',
      imageUrl: '',
      createdTimeStamp: initTimeStamp,
      lastSignInTimeStamp: initTimeStamp,
      friendIdList: <String>[],
    );
  }
}
