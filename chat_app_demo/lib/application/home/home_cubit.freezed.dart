// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStateTearOff {
  const _$HomeStateTearOff();

  _HomeState call(
      {required String emailAddress,
      required List<User> searchUserList,
      required LoadStatus searchStatus,
      required List<User> friendList,
      required LoadStatus friendListLoadStatus}) {
    return _HomeState(
      emailAddress: emailAddress,
      searchUserList: searchUserList,
      searchStatus: searchStatus,
      friendList: friendList,
      friendListLoadStatus: friendListLoadStatus,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
// required CompanyInfo companyInfo,
  String get emailAddress => throw _privateConstructorUsedError;
  List<User> get searchUserList => throw _privateConstructorUsedError;
  LoadStatus get searchStatus => throw _privateConstructorUsedError;
  List<User> get friendList => throw _privateConstructorUsedError;
  LoadStatus get friendListLoadStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {String emailAddress,
      List<User> searchUserList,
      LoadStatus searchStatus,
      List<User> friendList,
      LoadStatus friendListLoadStatus});

  $LoadStatusCopyWith<$Res> get searchStatus;
  $LoadStatusCopyWith<$Res> get friendListLoadStatus;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? searchUserList = freezed,
    Object? searchStatus = freezed,
    Object? friendList = freezed,
    Object? friendListLoadStatus = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      searchUserList: searchUserList == freezed
          ? _value.searchUserList
          : searchUserList // ignore: cast_nullable_to_non_nullable
              as List<User>,
      searchStatus: searchStatus == freezed
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      friendList: friendList == freezed
          ? _value.friendList
          : friendList // ignore: cast_nullable_to_non_nullable
              as List<User>,
      friendListLoadStatus: friendListLoadStatus == freezed
          ? _value.friendListLoadStatus
          : friendListLoadStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
    ));
  }

  @override
  $LoadStatusCopyWith<$Res> get searchStatus {
    return $LoadStatusCopyWith<$Res>(_value.searchStatus, (value) {
      return _then(_value.copyWith(searchStatus: value));
    });
  }

  @override
  $LoadStatusCopyWith<$Res> get friendListLoadStatus {
    return $LoadStatusCopyWith<$Res>(_value.friendListLoadStatus, (value) {
      return _then(_value.copyWith(friendListLoadStatus: value));
    });
  }
}

/// @nodoc
abstract class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
          _HomeState value, $Res Function(_HomeState) then) =
      __$HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String emailAddress,
      List<User> searchUserList,
      LoadStatus searchStatus,
      List<User> friendList,
      LoadStatus friendListLoadStatus});

  @override
  $LoadStatusCopyWith<$Res> get searchStatus;
  @override
  $LoadStatusCopyWith<$Res> get friendListLoadStatus;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(_HomeState _value, $Res Function(_HomeState) _then)
      : super(_value, (v) => _then(v as _HomeState));

  @override
  _HomeState get _value => super._value as _HomeState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? searchUserList = freezed,
    Object? searchStatus = freezed,
    Object? friendList = freezed,
    Object? friendListLoadStatus = freezed,
  }) {
    return _then(_HomeState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      searchUserList: searchUserList == freezed
          ? _value.searchUserList
          : searchUserList // ignore: cast_nullable_to_non_nullable
              as List<User>,
      searchStatus: searchStatus == freezed
          ? _value.searchStatus
          : searchStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      friendList: friendList == freezed
          ? _value.friendList
          : friendList // ignore: cast_nullable_to_non_nullable
              as List<User>,
      friendListLoadStatus: friendListLoadStatus == freezed
          ? _value.friendListLoadStatus
          : friendListLoadStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState(
      {required this.emailAddress,
      required this.searchUserList,
      required this.searchStatus,
      required this.friendList,
      required this.friendListLoadStatus})
      : super._();

  @override // required CompanyInfo companyInfo,
  final String emailAddress;
  @override
  final List<User> searchUserList;
  @override
  final LoadStatus searchStatus;
  @override
  final List<User> friendList;
  @override
  final LoadStatus friendListLoadStatus;

  @override
  String toString() {
    return 'HomeState(emailAddress: $emailAddress, searchUserList: $searchUserList, searchStatus: $searchStatus, friendList: $friendList, friendListLoadStatus: $friendListLoadStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.searchUserList, searchUserList) &&
            const DeepCollectionEquality()
                .equals(other.searchStatus, searchStatus) &&
            const DeepCollectionEquality()
                .equals(other.friendList, friendList) &&
            const DeepCollectionEquality()
                .equals(other.friendListLoadStatus, friendListLoadStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(searchUserList),
      const DeepCollectionEquality().hash(searchStatus),
      const DeepCollectionEquality().hash(friendList),
      const DeepCollectionEquality().hash(friendListLoadStatus));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {required String emailAddress,
      required List<User> searchUserList,
      required LoadStatus searchStatus,
      required List<User> friendList,
      required LoadStatus friendListLoadStatus}) = _$_HomeState;
  const _HomeState._() : super._();

  @override // required CompanyInfo companyInfo,
  String get emailAddress;
  @override
  List<User> get searchUserList;
  @override
  LoadStatus get searchStatus;
  @override
  List<User> get friendList;
  @override
  LoadStatus get friendListLoadStatus;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
