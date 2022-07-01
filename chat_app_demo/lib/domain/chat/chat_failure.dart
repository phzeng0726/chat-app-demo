import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure.freezed.dart';

// NOTE: sign in
@freezed
abstract class ChatFailure with _$ChatFailure {
  // 共用
  const factory ChatFailure.serverError() = _ServerError;
  const factory ChatFailure.insufficientPermission() = _InsufficientPermission;
  const factory ChatFailure.unexpected() = _Unexpected; // 未知錯誤
}
