import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

// NOTE: sign in
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.insufficientPermission() = _InsufficientPermission;
  const factory AuthFailure.unexpected() = _Unexpected; // 未知錯誤
  const factory AuthFailure.invalidEmailAndPassword() =
      _InvalidEmailAndPassword; // 帳號或密碼錯誤

  const factory AuthFailure.emailAddressAlreadyInUse() =
      _EmailAlreadyInUse; // Email已被使用
}
