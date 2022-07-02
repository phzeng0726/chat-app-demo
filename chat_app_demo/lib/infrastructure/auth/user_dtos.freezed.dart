// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserListDto _$UserListDtoFromJson(Map<String, dynamic> json) {
  return _UserListDto.fromJson(json);
}

/// @nodoc
class _$UserListDtoTearOff {
  const _$UserListDtoTearOff();

  _UserListDto call({required List<UserDto> list}) {
    return _UserListDto(
      list: list,
    );
  }

  UserListDto fromJson(Map<String, Object?> json) {
    return UserListDto.fromJson(json);
  }
}

/// @nodoc
const $UserListDto = _$UserListDtoTearOff();

/// @nodoc
mixin _$UserListDto {
  List<UserDto> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserListDtoCopyWith<UserListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListDtoCopyWith<$Res> {
  factory $UserListDtoCopyWith(
          UserListDto value, $Res Function(UserListDto) then) =
      _$UserListDtoCopyWithImpl<$Res>;
  $Res call({List<UserDto> list});
}

/// @nodoc
class _$UserListDtoCopyWithImpl<$Res> implements $UserListDtoCopyWith<$Res> {
  _$UserListDtoCopyWithImpl(this._value, this._then);

  final UserListDto _value;
  // ignore: unused_field
  final $Res Function(UserListDto) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ));
  }
}

/// @nodoc
abstract class _$UserListDtoCopyWith<$Res>
    implements $UserListDtoCopyWith<$Res> {
  factory _$UserListDtoCopyWith(
          _UserListDto value, $Res Function(_UserListDto) then) =
      __$UserListDtoCopyWithImpl<$Res>;
  @override
  $Res call({List<UserDto> list});
}

/// @nodoc
class __$UserListDtoCopyWithImpl<$Res> extends _$UserListDtoCopyWithImpl<$Res>
    implements _$UserListDtoCopyWith<$Res> {
  __$UserListDtoCopyWithImpl(
      _UserListDto _value, $Res Function(_UserListDto) _then)
      : super(_value, (v) => _then(v as _UserListDto));

  @override
  _UserListDto get _value => super._value as _UserListDto;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_UserListDto(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserListDto extends _UserListDto {
  const _$_UserListDto({required this.list}) : super._();

  factory _$_UserListDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserListDtoFromJson(json);

  @override
  final List<UserDto> list;

  @override
  String toString() {
    return 'UserListDto(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserListDto &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  @JsonKey(ignore: true)
  @override
  _$UserListDtoCopyWith<_UserListDto> get copyWith =>
      __$UserListDtoCopyWithImpl<_UserListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserListDtoToJson(this);
  }
}

abstract class _UserListDto extends UserListDto {
  const factory _UserListDto({required List<UserDto> list}) = _$_UserListDto;
  const _UserListDto._() : super._();

  factory _UserListDto.fromJson(Map<String, dynamic> json) =
      _$_UserListDto.fromJson;

  @override
  List<UserDto> get list;
  @override
  @JsonKey(ignore: true)
  _$UserListDtoCopyWith<_UserListDto> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
class _$UserDtoTearOff {
  const _$UserDtoTearOff();

  _UserDto call(
      {required String userId,
      required String emailAddress,
      required String userName,
      required String phoneNumber,
      required String aboutMe,
      required String photoUrl,
      required int createdTimeStamp,
      required int lastSignInTimeStamp,
      required List<String> friendIdList}) {
    return _UserDto(
      userId: userId,
      emailAddress: emailAddress,
      userName: userName,
      phoneNumber: phoneNumber,
      aboutMe: aboutMe,
      photoUrl: photoUrl,
      createdTimeStamp: createdTimeStamp,
      lastSignInTimeStamp: lastSignInTimeStamp,
      friendIdList: friendIdList,
    );
  }

  UserDto fromJson(Map<String, Object?> json) {
    return UserDto.fromJson(json);
  }
}

/// @nodoc
const $UserDto = _$UserDtoTearOff();

/// @nodoc
mixin _$UserDto {
  String get userId => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get aboutMe => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  int get createdTimeStamp => throw _privateConstructorUsedError;
  int get lastSignInTimeStamp => throw _privateConstructorUsedError;
  List<String> get friendIdList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String emailAddress,
      String userName,
      String phoneNumber,
      String aboutMe,
      String photoUrl,
      int createdTimeStamp,
      int lastSignInTimeStamp,
      List<String> friendIdList});
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
    Object? aboutMe = freezed,
    Object? photoUrl = freezed,
    Object? createdTimeStamp = freezed,
    Object? lastSignInTimeStamp = freezed,
    Object? friendIdList = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: aboutMe == freezed
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      lastSignInTimeStamp: lastSignInTimeStamp == freezed
          ? _value.lastSignInTimeStamp
          : lastSignInTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      friendIdList: friendIdList == freezed
          ? _value.friendIdList
          : friendIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) then) =
      __$UserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String emailAddress,
      String userName,
      String phoneNumber,
      String aboutMe,
      String photoUrl,
      int createdTimeStamp,
      int lastSignInTimeStamp,
      List<String> friendIdList});
}

/// @nodoc
class __$UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(_UserDto _value, $Res Function(_UserDto) _then)
      : super(_value, (v) => _then(v as _UserDto));

  @override
  _UserDto get _value => super._value as _UserDto;

  @override
  $Res call({
    Object? userId = freezed,
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
    Object? aboutMe = freezed,
    Object? photoUrl = freezed,
    Object? createdTimeStamp = freezed,
    Object? lastSignInTimeStamp = freezed,
    Object? friendIdList = freezed,
  }) {
    return _then(_UserDto(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      aboutMe: aboutMe == freezed
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      lastSignInTimeStamp: lastSignInTimeStamp == freezed
          ? _value.lastSignInTimeStamp
          : lastSignInTimeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      friendIdList: friendIdList == freezed
          ? _value.friendIdList
          : friendIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {required this.userId,
      required this.emailAddress,
      required this.userName,
      required this.phoneNumber,
      required this.aboutMe,
      required this.photoUrl,
      required this.createdTimeStamp,
      required this.lastSignInTimeStamp,
      required this.friendIdList})
      : super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserDtoFromJson(json);

  @override
  final String userId;
  @override
  final String emailAddress;
  @override
  final String userName;
  @override
  final String phoneNumber;
  @override
  final String aboutMe;
  @override
  final String photoUrl;
  @override
  final int createdTimeStamp;
  @override
  final int lastSignInTimeStamp;
  @override
  final List<String> friendIdList;

  @override
  String toString() {
    return 'UserDto(userId: $userId, emailAddress: $emailAddress, userName: $userName, phoneNumber: $phoneNumber, aboutMe: $aboutMe, photoUrl: $photoUrl, createdTimeStamp: $createdTimeStamp, lastSignInTimeStamp: $lastSignInTimeStamp, friendIdList: $friendIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDto &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.aboutMe, aboutMe) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.createdTimeStamp, createdTimeStamp) &&
            const DeepCollectionEquality()
                .equals(other.lastSignInTimeStamp, lastSignInTimeStamp) &&
            const DeepCollectionEquality()
                .equals(other.friendIdList, friendIdList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(aboutMe),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(createdTimeStamp),
      const DeepCollectionEquality().hash(lastSignInTimeStamp),
      const DeepCollectionEquality().hash(friendIdList));

  @JsonKey(ignore: true)
  @override
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDtoToJson(this);
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {required String userId,
      required String emailAddress,
      required String userName,
      required String phoneNumber,
      required String aboutMe,
      required String photoUrl,
      required int createdTimeStamp,
      required int lastSignInTimeStamp,
      required List<String> friendIdList}) = _$_UserDto;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  String get userId;
  @override
  String get emailAddress;
  @override
  String get userName;
  @override
  String get phoneNumber;
  @override
  String get aboutMe;
  @override
  String get photoUrl;
  @override
  int get createdTimeStamp;
  @override
  int get lastSignInTimeStamp;
  @override
  List<String> get friendIdList;
  @override
  @JsonKey(ignore: true)
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
