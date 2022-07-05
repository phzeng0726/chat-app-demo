import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_failure.freezed.dart';

@freezed
abstract class HomeFailure with _$HomeFailure {
  // 共用
  const factory HomeFailure.serverError() = _ServerError;
  const factory HomeFailure.insufficientPermission() = _InsufficientPermission;
  const factory HomeFailure.unexpected() = _Unexpected; // 未知錯誤
  const factory HomeFailure.userNotExist() = _UserNotExist; 
}
