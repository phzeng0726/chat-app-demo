// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_message_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessageListDto _$ChatMessageListDtoFromJson(Map<String, dynamic> json) {
  return _ChatMessageListDto.fromJson(json);
}

/// @nodoc
class _$ChatMessageListDtoTearOff {
  const _$ChatMessageListDtoTearOff();

  _ChatMessageListDto call({required List<ChatMessageDto> list}) {
    return _ChatMessageListDto(
      list: list,
    );
  }

  ChatMessageListDto fromJson(Map<String, Object?> json) {
    return ChatMessageListDto.fromJson(json);
  }
}

/// @nodoc
const $ChatMessageListDto = _$ChatMessageListDtoTearOff();

/// @nodoc
mixin _$ChatMessageListDto {
  List<ChatMessageDto> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageListDtoCopyWith<ChatMessageListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageListDtoCopyWith<$Res> {
  factory $ChatMessageListDtoCopyWith(
          ChatMessageListDto value, $Res Function(ChatMessageListDto) then) =
      _$ChatMessageListDtoCopyWithImpl<$Res>;
  $Res call({List<ChatMessageDto> list});
}

/// @nodoc
class _$ChatMessageListDtoCopyWithImpl<$Res>
    implements $ChatMessageListDtoCopyWith<$Res> {
  _$ChatMessageListDtoCopyWithImpl(this._value, this._then);

  final ChatMessageListDto _value;
  // ignore: unused_field
  final $Res Function(ChatMessageListDto) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageDto>,
    ));
  }
}

/// @nodoc
abstract class _$ChatMessageListDtoCopyWith<$Res>
    implements $ChatMessageListDtoCopyWith<$Res> {
  factory _$ChatMessageListDtoCopyWith(
          _ChatMessageListDto value, $Res Function(_ChatMessageListDto) then) =
      __$ChatMessageListDtoCopyWithImpl<$Res>;
  @override
  $Res call({List<ChatMessageDto> list});
}

/// @nodoc
class __$ChatMessageListDtoCopyWithImpl<$Res>
    extends _$ChatMessageListDtoCopyWithImpl<$Res>
    implements _$ChatMessageListDtoCopyWith<$Res> {
  __$ChatMessageListDtoCopyWithImpl(
      _ChatMessageListDto _value, $Res Function(_ChatMessageListDto) _then)
      : super(_value, (v) => _then(v as _ChatMessageListDto));

  @override
  _ChatMessageListDto get _value => super._value as _ChatMessageListDto;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_ChatMessageListDto(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessageListDto extends _ChatMessageListDto {
  const _$_ChatMessageListDto({required this.list}) : super._();

  factory _$_ChatMessageListDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageListDtoFromJson(json);

  @override
  final List<ChatMessageDto> list;

  @override
  String toString() {
    return 'ChatMessageListDto(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageListDto &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$ChatMessageListDtoCopyWith<_ChatMessageListDto> get copyWith =>
      __$ChatMessageListDtoCopyWithImpl<_ChatMessageListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageListDtoToJson(this);
  }
}

abstract class _ChatMessageListDto extends ChatMessageListDto {
  const factory _ChatMessageListDto({required List<ChatMessageDto> list}) =
      _$_ChatMessageListDto;
  const _ChatMessageListDto._() : super._();

  factory _ChatMessageListDto.fromJson(Map<String, dynamic> json) =
      _$_ChatMessageListDto.fromJson;

  @override
  List<ChatMessageDto> get list;
  @override
  @JsonKey(ignore: true)
  _$ChatMessageListDtoCopyWith<_ChatMessageListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessageDto _$ChatMessageDtoFromJson(Map<String, dynamic> json) {
  return _ChatMessageDto.fromJson(json);
}

/// @nodoc
class _$ChatMessageDtoTearOff {
  const _$ChatMessageDtoTearOff();

  _ChatMessageDto call(
      {required String fromId,
      required String toId,
      required String content,
      required int createdTimeStamp,
      required int type}) {
    return _ChatMessageDto(
      fromId: fromId,
      toId: toId,
      content: content,
      createdTimeStamp: createdTimeStamp,
      type: type,
    );
  }

  ChatMessageDto fromJson(Map<String, Object?> json) {
    return ChatMessageDto.fromJson(json);
  }
}

/// @nodoc
const $ChatMessageDto = _$ChatMessageDtoTearOff();

/// @nodoc
mixin _$ChatMessageDto {
  String get fromId => throw _privateConstructorUsedError;
  String get toId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get createdTimeStamp => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageDtoCopyWith<ChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageDtoCopyWith<$Res> {
  factory $ChatMessageDtoCopyWith(
          ChatMessageDto value, $Res Function(ChatMessageDto) then) =
      _$ChatMessageDtoCopyWithImpl<$Res>;
  $Res call(
      {String fromId,
      String toId,
      String content,
      int createdTimeStamp,
      int type});
}

/// @nodoc
class _$ChatMessageDtoCopyWithImpl<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  _$ChatMessageDtoCopyWithImpl(this._value, this._then);

  final ChatMessageDto _value;
  // ignore: unused_field
  final $Res Function(ChatMessageDto) _then;

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
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ChatMessageDtoCopyWith<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  factory _$ChatMessageDtoCopyWith(
          _ChatMessageDto value, $Res Function(_ChatMessageDto) then) =
      __$ChatMessageDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String fromId,
      String toId,
      String content,
      int createdTimeStamp,
      int type});
}

/// @nodoc
class __$ChatMessageDtoCopyWithImpl<$Res>
    extends _$ChatMessageDtoCopyWithImpl<$Res>
    implements _$ChatMessageDtoCopyWith<$Res> {
  __$ChatMessageDtoCopyWithImpl(
      _ChatMessageDto _value, $Res Function(_ChatMessageDto) _then)
      : super(_value, (v) => _then(v as _ChatMessageDto));

  @override
  _ChatMessageDto get _value => super._value as _ChatMessageDto;

  @override
  $Res call({
    Object? fromId = freezed,
    Object? toId = freezed,
    Object? content = freezed,
    Object? createdTimeStamp = freezed,
    Object? type = freezed,
  }) {
    return _then(_ChatMessageDto(
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
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessageDto extends _ChatMessageDto {
  const _$_ChatMessageDto(
      {required this.fromId,
      required this.toId,
      required this.content,
      required this.createdTimeStamp,
      required this.type})
      : super._();

  factory _$_ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageDtoFromJson(json);

  @override
  final String fromId;
  @override
  final String toId;
  @override
  final String content;
  @override
  final int createdTimeStamp;
  @override
  final int type;

  @override
  String toString() {
    return 'ChatMessageDto(fromId: $fromId, toId: $toId, content: $content, createdTimeStamp: $createdTimeStamp, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatMessageDto &&
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
  _$ChatMessageDtoCopyWith<_ChatMessageDto> get copyWith =>
      __$ChatMessageDtoCopyWithImpl<_ChatMessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageDtoToJson(this);
  }
}

abstract class _ChatMessageDto extends ChatMessageDto {
  const factory _ChatMessageDto(
      {required String fromId,
      required String toId,
      required String content,
      required int createdTimeStamp,
      required int type}) = _$_ChatMessageDto;
  const _ChatMessageDto._() : super._();

  factory _ChatMessageDto.fromJson(Map<String, dynamic> json) =
      _$_ChatMessageDto.fromJson;

  @override
  String get fromId;
  @override
  String get toId;
  @override
  String get content;
  @override
  int get createdTimeStamp;
  @override
  int get type;
  @override
  @JsonKey(ignore: true)
  _$ChatMessageDtoCopyWith<_ChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
