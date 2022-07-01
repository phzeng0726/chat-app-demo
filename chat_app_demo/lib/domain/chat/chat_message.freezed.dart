// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatMessageTearOff {
  const _$ChatMessageTearOff();

  _ChatMessage call(
      {required String fromId,
      required String toId,
      required String content,
      required DeviceTimeStamp createdTimeStamp,
      required int type}) {
    return _ChatMessage(
      fromId: fromId,
      toId: toId,
      content: content,
      createdTimeStamp: createdTimeStamp,
      type: type,
    );
  }
}

/// @nodoc
const $ChatMessage = _$ChatMessageTearOff();

/// @nodoc
mixin _$ChatMessage {
  String get fromId => throw _privateConstructorUsedError;
  String get toId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DeviceTimeStamp get createdTimeStamp => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res>;
  $Res call(
      {String fromId,
      String toId,
      String content,
      DeviceTimeStamp createdTimeStamp,
      int type});

  $DeviceTimeStampCopyWith<$Res> get createdTimeStamp;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res> implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  final ChatMessage _value;
  // ignore: unused_field
  final $Res Function(ChatMessage) _then;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? content = freezed,
    Object? createdTimeStamp = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String,
      toId: toId == freezed
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp // ignore: cast_nullable_to_non_nullable
              as DeviceTimeStamp,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $DeviceTimeStampCopyWith<$Res> get createdTimeStamp {
    return $DeviceTimeStampCopyWith<$Res>(_value.createdTimeStamp, (value) {
      return _then(_value.copyWith(createdTimeStamp: value));
    });
  }
}

/// @nodoc
abstract class _$ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(
          _ChatMessage value, $Res Function(_ChatMessage) then) =
      __$ChatMessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String fromId,
      String toId,
      String content,
      DeviceTimeStamp createdTimeStamp,
      int type});

  @override
  $DeviceTimeStampCopyWith<$Res> get createdTimeStamp;
}

/// @nodoc
class __$ChatMessageCopyWithImpl<$Res> extends _$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(
      _ChatMessage _value, $Res Function(_ChatMessage) _then)
      : super(_value, (v) => _then(v as _ChatMessage));

  @override
  _ChatMessage get _value => super._value as _ChatMessage;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? content = freezed,
    Object? createdTimeStamp = freezed,
    Object? type = freezed,
  }) {
    return _then(_ChatMessage(
      fromId: fromId == freezed
          ? _value.fromId
          : fromId // ignore: cast_nullable_to_non_nullable
              as String,
      toId: toId == freezed
          ? _value.toId
          : toId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp // ignore: cast_nullable_to_non_nullable
              as DeviceTimeStamp,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChatMessage extends _ChatMessage {
  const _$_ChatMessage(
      {required this.fromId,
      required this.toId,
      required this.content,
      required this.createdTimeStamp,
      required this.type})
      : super._();

  @override
  final String fromId;
  @override
  final String toId;
  @override
  final String content;
  @override
  final DeviceTimeStamp createdTimeStamp;
  @override
  final int type;

  @override
  String toString() {
    return 'ChatMessage(fromId: $fromId, toId: $toId, content: $content, createdTimeStamp: $createdTimeStamp, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessage &&
            const DeepCollectionEquality().equals(other.fromId, fromId) &&
            const DeepCollectionEquality().equals(other.toId, toId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.createdTimeStamp, createdTimeStamp) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fromId),
      const DeepCollectionEquality().hash(toId),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(createdTimeStamp),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);
}

abstract class _ChatMessage extends ChatMessage {
  const factory _ChatMessage(
      {required String fromId,
      required String toId,
      required String content,
      required DeviceTimeStamp createdTimeStamp,
      required int type}) = _$_ChatMessage;
  const _ChatMessage._() : super._();

  @override
  String get fromId;
  @override
  String get toId;
  @override
  String get content;
  @override
  DeviceTimeStamp get createdTimeStamp;
  @override
  int get type;
  @override
  @JsonKey(ignore: true)
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
