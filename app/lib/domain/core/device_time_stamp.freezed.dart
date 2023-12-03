// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_time_stamp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceTimeStampTearOff {
  const _$DeviceTimeStampTearOff();

  _DeviceTimeStamp call(DateTime value) {
    return _DeviceTimeStamp(
      value,
    );
  }
}

/// @nodoc
const $DeviceTimeStamp = _$DeviceTimeStampTearOff();

/// @nodoc
mixin _$DeviceTimeStamp {
  DateTime get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceTimeStampCopyWith<DeviceTimeStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceTimeStampCopyWith<$Res> {
  factory $DeviceTimeStampCopyWith(
          DeviceTimeStamp value, $Res Function(DeviceTimeStamp) then) =
      _$DeviceTimeStampCopyWithImpl<$Res>;
  $Res call({DateTime value});
}

/// @nodoc
class _$DeviceTimeStampCopyWithImpl<$Res>
    implements $DeviceTimeStampCopyWith<$Res> {
  _$DeviceTimeStampCopyWithImpl(this._value, this._then);

  final DeviceTimeStamp _value;
  // ignore: unused_field
  final $Res Function(DeviceTimeStamp) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DeviceTimeStampCopyWith<$Res>
    implements $DeviceTimeStampCopyWith<$Res> {
  factory _$DeviceTimeStampCopyWith(
          _DeviceTimeStamp value, $Res Function(_DeviceTimeStamp) then) =
      __$DeviceTimeStampCopyWithImpl<$Res>;
  @override
  $Res call({DateTime value});
}

/// @nodoc
class __$DeviceTimeStampCopyWithImpl<$Res>
    extends _$DeviceTimeStampCopyWithImpl<$Res>
    implements _$DeviceTimeStampCopyWith<$Res> {
  __$DeviceTimeStampCopyWithImpl(
      _DeviceTimeStamp _value, $Res Function(_DeviceTimeStamp) _then)
      : super(_value, (v) => _then(v as _DeviceTimeStamp));

  @override
  _DeviceTimeStamp get _value => super._value as _DeviceTimeStamp;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_DeviceTimeStamp(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_DeviceTimeStamp extends _DeviceTimeStamp {
  const _$_DeviceTimeStamp(this.value) : super._();

  @override
  final DateTime value;

  @override
  String toString() {
    return 'DeviceTimeStamp(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeviceTimeStamp &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$DeviceTimeStampCopyWith<_DeviceTimeStamp> get copyWith =>
      __$DeviceTimeStampCopyWithImpl<_DeviceTimeStamp>(this, _$identity);
}

abstract class _DeviceTimeStamp extends DeviceTimeStamp {
  const factory _DeviceTimeStamp(DateTime value) = _$_DeviceTimeStamp;
  const _DeviceTimeStamp._() : super._();

  @override
  DateTime get value;
  @override
  @JsonKey(ignore: true)
  _$DeviceTimeStampCopyWith<_DeviceTimeStamp> get copyWith =>
      throw _privateConstructorUsedError;
}
