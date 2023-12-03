import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

// NOTE: sign in
@freezed
abstract class AuthFailure with _$AuthFailure {
  // 共用
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.insufficientPermission() = _InsufficientPermission;
  const factory AuthFailure.unexpected() = _Unexpected; // 未知錯誤
  // 登入
  const factory AuthFailure.invalidEmailAndPassword() =
      _InvalidEmailAndPassword; // 帳號或密碼錯誤

  // 註冊
  const factory AuthFailure.emailAddressAlreadyInUse() =
      _EmailAlreadyInUse; // Email 已被使用
  const factory AuthFailure.invalidEmail() = _InvalidEmail; // Email 格式有誤
  const factory AuthFailure.weakPassword() = _WeakPassword; // 密碼強度太弱

}
