// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageListDto _$ImageListDtoFromJson(Map<String, dynamic> json) {
  return _ImageListDto.fromJson(json);
}

/// @nodoc
class _$ImageListDtoTearOff {
  const _$ImageListDtoTearOff();

  _ImageListDto call({required List<ImageDto> list}) {
    return _ImageListDto(
      list: list,
    );
  }

  ImageListDto fromJson(Map<String, Object?> json) {
    return ImageListDto.fromJson(json);
  }
}

/// @nodoc
const $ImageListDto = _$ImageListDtoTearOff();

/// @nodoc
mixin _$ImageListDto {
  List<ImageDto> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageListDtoCopyWith<ImageListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageListDtoCopyWith<$Res> {
  factory $ImageListDtoCopyWith(
          ImageListDto value, $Res Function(ImageListDto) then) =
      _$ImageListDtoCopyWithImpl<$Res>;
  $Res call({List<ImageDto> list});
}

/// @nodoc
class _$ImageListDtoCopyWithImpl<$Res> implements $ImageListDtoCopyWith<$Res> {
  _$ImageListDtoCopyWithImpl(this._value, this._then);

  final ImageListDto _value;
  // ignore: unused_field
  final $Res Function(ImageListDto) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>,
    ));
  }
}

/// @nodoc
abstract class _$ImageListDtoCopyWith<$Res>
    implements $ImageListDtoCopyWith<$Res> {
  factory _$ImageListDtoCopyWith(
          _ImageListDto value, $Res Function(_ImageListDto) then) =
      __$ImageListDtoCopyWithImpl<$Res>;
  @override
  $Res call({List<ImageDto> list});
}

/// @nodoc
class __$ImageListDtoCopyWithImpl<$Res> extends _$ImageListDtoCopyWithImpl<$Res>
    implements _$ImageListDtoCopyWith<$Res> {
  __$ImageListDtoCopyWithImpl(
      _ImageListDto _value, $Res Function(_ImageListDto) _then)
      : super(_value, (v) => _then(v as _ImageListDto));

  @override
  _ImageListDto get _value => super._value as _ImageListDto;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_ImageListDto(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ImageDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageListDto extends _ImageListDto {
  const _$_ImageListDto({required this.list}) : super._();

  factory _$_ImageListDto.fromJson(Map<String, dynamic> json) =>
      _$$_ImageListDtoFromJson(json);

  @override
  final List<ImageDto> list;

  @override
  String toString() {
    return 'ImageListDto(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageListDto &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$ImageListDtoCopyWith<_ImageListDto> get copyWith =>
      __$ImageListDtoCopyWithImpl<_ImageListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageListDtoToJson(this);
  }
}

abstract class _ImageListDto extends ImageListDto {
  const factory _ImageListDto({required List<ImageDto> list}) = _$_ImageListDto;
  const _ImageListDto._() : super._();

  factory _ImageListDto.fromJson(Map<String, dynamic> json) =
      _$_ImageListDto.fromJson;

  @override
  List<ImageDto> get list;
  @override
  @JsonKey(ignore: true)
  _$ImageListDtoCopyWith<_ImageListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) {
  return _ImageDto.fromJson(json);
}

/// @nodoc
class _$ImageDtoTearOff {
  const _$ImageDtoTearOff();

  _ImageDto call(
      {required String url, required String path, required String userId}) {
    return _ImageDto(
      url: url,
      path: path,
      userId: userId,
    );
  }

  ImageDto fromJson(Map<String, Object?> json) {
    return ImageDto.fromJson(json);
  }
}

/// @nodoc
const $ImageDto = _$ImageDtoTearOff();

/// @nodoc
mixin _$ImageDto {
  String get url => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDtoCopyWith<ImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDtoCopyWith<$Res> {
  factory $ImageDtoCopyWith(ImageDto value, $Res Function(ImageDto) then) =
      _$ImageDtoCopyWithImpl<$Res>;
  $Res call({String url, String path, String userId});
}

/// @nodoc
class _$ImageDtoCopyWithImpl<$Res> implements $ImageDtoCopyWith<$Res> {
  _$ImageDtoCopyWithImpl(this._value, this._then);

  final ImageDto _value;
  // ignore: unused_field
  final $Res Function(ImageDto) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? path = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ImageDtoCopyWith<$Res> implements $ImageDtoCopyWith<$Res> {
  factory _$ImageDtoCopyWith(_ImageDto value, $Res Function(_ImageDto) then) =
      __$ImageDtoCopyWithImpl<$Res>;
  @override
  $Res call({String url, String path, String userId});
}

/// @nodoc
class __$ImageDtoCopyWithImpl<$Res> extends _$ImageDtoCopyWithImpl<$Res>
    implements _$ImageDtoCopyWith<$Res> {
  __$ImageDtoCopyWithImpl(_ImageDto _value, $Res Function(_ImageDto) _then)
      : super(_value, (v) => _then(v as _ImageDto));

  @override
  _ImageDto get _value => super._value as _ImageDto;

  @override
  $Res call({
    Object? url = freezed,
    Object? path = freezed,
    Object? userId = freezed,
  }) {
    return _then(_ImageDto(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageDto extends _ImageDto {
  const _$_ImageDto(
      {required this.url, required this.path, required this.userId})
      : super._();

  factory _$_ImageDto.fromJson(Map<String, dynamic> json) =>
      _$$_ImageDtoFromJson(json);

  @override
  final String url;
  @override
  final String path;
  @override
  final String userId;

  @override
  String toString() {
    return 'ImageDto(url: $url, path: $path, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImageDto &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$ImageDtoCopyWith<_ImageDto> get copyWith =>
      __$ImageDtoCopyWithImpl<_ImageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageDtoToJson(this);
  }
}

abstract class _ImageDto extends ImageDto {
  const factory _ImageDto(
      {required String url,
      required String path,
      required String userId}) = _$_ImageDto;
  const _ImageDto._() : super._();

  factory _ImageDto.fromJson(Map<String, dynamic> json) = _$_ImageDto.fromJson;

  @override
  String get url;
  @override
  String get path;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$ImageDtoCopyWith<_ImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
