import 'package:freezed_annotation/freezed_annotation.dart';

part 'load_status.freezed.dart';

@freezed
class LoadStatus with _$LoadStatus {
  const factory LoadStatus.initial() = _Initial;
  const factory LoadStatus.inProgress() = _inProgress;
  const factory LoadStatus.succeed() = _Succeed;
  const factory LoadStatus.failed() = _Failed;
}