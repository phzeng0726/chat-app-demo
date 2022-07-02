// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String userId,
      required String emailAddress,
      required String userName,
      required String phoneNumber,
      required DeviceTimeStamp createdTimeStamp,
      required DeviceTimeStamp lastSignInTimeStamp,
      required List<String> friendIdList}) {
    return _User(
      userId: userId,
      emailAddress: emailAddress,
      userName: userName,
      phoneNumber: phoneNumber,
      createdTimeStamp: createdTimeStamp,
      lastSignInTimeStamp: lastSignInTimeStamp,
      friendIdList: friendIdList,
    );
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get userId => throw _privateConstructorUsedError; // unique key
  String get emailAddress => throw _privateConstructorUsedError; // 電子信箱
  String get userName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  DeviceTimeStamp get createdTimeStamp => throw _privateConstructorUsedError;
  DeviceTimeStamp get lastSignInTimeStamp => throw _privateConstructorUsedError;
  List<String> get friendIdList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String emailAddress,
      String userName,
      String phoneNumber,
      DeviceTimeStamp createdTimeStamp,
      DeviceTimeStamp lastSignInTimeStamp,
      List<String> friendIdList});

  $DeviceTimeStampCopyWith<$Res> get createdTimeStamp;
  $DeviceTimeStampCopyWith<$Res> get lastSignInTimeStamp;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
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
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp // ignore: cast_nullable_to_non_nullable
              as DeviceTimeStamp,
      lastSignInTimeStamp: lastSignInTimeStamp == freezed
          ? _value.lastSignInTimeStamp
          : lastSignInTimeStamp // ignore: cast_nullable_to_non_nullable
              as DeviceTimeStamp,
      friendIdList: friendIdList == freezed
          ? _value.friendIdList
          : friendIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $DeviceTimeStampCopyWith<$Res> get createdTimeStamp {
    return $DeviceTimeStampCopyWith<$Res>(_value.createdTimeStamp, (value) {
      return _then(_value.copyWith(createdTimeStamp: value));
    });
  }

  @override
  $DeviceTimeStampCopyWith<$Res> get lastSignInTimeStamp {
    return $DeviceTimeStampCopyWith<$Res>(_value.lastSignInTimeStamp, (value) {
      return _then(_value.copyWith(lastSignInTimeStamp: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userId,
      String emailAddress,
      String userName,
      String phoneNumber,
      DeviceTimeStamp createdTimeStamp,
      DeviceTimeStamp lastSignInTimeStamp,
      List<String> friendIdList});

  @override
  $DeviceTimeStampCopyWith<$Res> get createdTimeStamp;
  @override
  $DeviceTimeStampCopyWith<$Res> get lastSignInTimeStamp;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? userId = freezed,
    Object? emailAddress = freezed,
    Object? userName = freezed,
    Object? phoneNumber = freezed,
    Object? createdTimeStamp = freezed,
    Object? lastSignInTimeStamp = freezed,
    Object? friendIdList = freezed,
  }) {
    return _then(_User(
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
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp // ignore: cast_nullable_to_non_nullable
              as DeviceTimeStamp,
      lastSignInTimeStamp: lastSignInTimeStamp == freezed
          ? _value.lastSignInTimeStamp
          : lastSignInTimeStamp // ignore: cast_nullable_to_non_nullable
              as DeviceTimeStamp,
      friendIdList: friendIdList == freezed
          ? _value.friendIdList
          : friendIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  const _$_User(
      {required this.userId,
      required this.emailAddress,
      required this.userName,
      required this.phoneNumber,
      required this.createdTimeStamp,
      required this.lastSignInTimeStamp,
      required this.friendIdList})
      : super._();

  @override
  final String userId;
  @override // unique key
  final String emailAddress;
  @override // 電子信箱
  final String userName;
  @override
  final String phoneNumber;
  @override
  final DeviceTimeStamp createdTimeStamp;
  @override
  final DeviceTimeStamp lastSignInTimeStamp;
  @override
  final List<String> friendIdList;

  @override
  String toString() {
    return 'User(userId: $userId, emailAddress: $emailAddress, userName: $userName, phoneNumber: $phoneNumber, createdTimeStamp: $createdTimeStamp, lastSignInTimeStamp: $lastSignInTimeStamp, friendIdList: $friendIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
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
      const DeepCollectionEquality().hash(createdTimeStamp),
      const DeepCollectionEquality().hash(lastSignInTimeStamp),
      const DeepCollectionEquality().hash(friendIdList));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required String userId,
      required String emailAddress,
      required String userName,
      required String phoneNumber,
      required DeviceTimeStamp createdTimeStamp,
      required DeviceTimeStamp lastSignInTimeStamp,
      required List<String> friendIdList}) = _$_User;
  const _User._() : super._();

  @override
  String get userId;
  @override // unique key
  String get emailAddress;
  @override // 電子信箱
  String get userName;
  @override
  String get phoneNumber;
  @override
  DeviceTimeStamp get createdTimeStamp;
  @override
  DeviceTimeStamp get lastSignInTimeStamp;
  @override
  List<String> get friendIdList;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
