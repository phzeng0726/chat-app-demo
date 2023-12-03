import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_time_stamp.freezed.dart';

@freezed
class DeviceTimeStamp with _$DeviceTimeStamp {
  const DeviceTimeStamp._();

  const factory DeviceTimeStamp(DateTime value) = _DeviceTimeStamp;

  factory DeviceTimeStamp.initial() => DeviceTimeStamp(
        DateTime.parse('1900-01-01'),
      );
  factory DeviceTimeStamp.now() => DeviceTimeStamp(
        DateTime.now(),
      );

  factory DeviceTimeStamp.fromString(String time) => DeviceTimeStamp(
        DateTime.parse(time),
      );
  factory DeviceTimeStamp.fromInt(int time) => DeviceTimeStamp(
        DateTime.fromMicrosecondsSinceEpoch(time),
      );
  int toInt() => value.microsecondsSinceEpoch;
  String toReadableString() =>
      '${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')} ${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
  String toHourMinuteString() =>
      '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
}
