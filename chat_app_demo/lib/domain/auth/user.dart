import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();

  const factory User({
    required String userId, // unique key
    // required String emailAddress, // 電子信箱
    // required String password, // 密碼
    // required String userName,
  }) = _User;

  factory User.empty() => const User(
        userId: '',
        // emailAddress: '',
        // password: '',
        // userName: '',
      );
}
