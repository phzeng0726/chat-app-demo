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
      required List<User> searchedUserList,
      required LoadStatus searchStatus,
      required List<User> friendList,
      required LoadStatus friendListLoadStatus,
      required Option<ChatFailure> chatFailureOption}) {
    return _HomeState(
      emailAddress: emailAddress,
      searchedUserList: searchedUserList,
      searchStatus: searchStatus,
      friendList: friendList,
      friendListLoadStatus: friendListLoadStatus,
      chatFailureOption: chatFailureOption,
    );
  }
}

/// @nodoc
const $HomeState = _$HomeStateTearOff();

/// @nodoc
mixin _$HomeState {
// required CompanyInfo companyInfo,
  String get emailAddress =>
      throw _privateConstructorUsedError; // 可能要改Option，因為有可能為空
  List<User> get searchedUserList => throw _privateConstructorUsedError;
  LoadStatus get searchStatus => throw _privateConstructorUsedError;
  List<User> get friendList => throw _privateConstructorUsedError;
  LoadStatus get friendListLoadStatus => throw _privateConstructorUsedError;
  Option<ChatFailure> get chatFailureOption =>
      throw _privateConstructorUsedError;

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
      List<User> searchedUserList,
      LoadStatus searchStatus,
      List<User> friendList,
      LoadStatus friendListLoadStatus,
      Option<ChatFailure> chatFailureOption});

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
    Object? searchedUserList = freezed,
    Object? searchStatus = freezed,
    Object? friendList = freezed,
    Object? friendListLoadStatus = freezed,
    Object? chatFailureOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      searchedUserList: searchedUserList == freezed
          ? _value.searchedUserList
          : searchedUserList // ignore: cast_nullable_to_non_nullable
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
      chatFailureOption: chatFailureOption == freezed
          ? _value.chatFailureOption
          : chatFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<ChatFailure>,
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
      List<User> searchedUserList,
      LoadStatus searchStatus,
      List<User> friendList,
      LoadStatus friendListLoadStatus,
      Option<ChatFailure> chatFailureOption});

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
    Object? searchedUserList = freezed,
    Object? searchStatus = freezed,
    Object? friendList = freezed,
    Object? friendListLoadStatus = freezed,
    Object? chatFailureOption = freezed,
  }) {
    return _then(_HomeState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      searchedUserList: searchedUserList == freezed
          ? _value.searchedUserList
          : searchedUserList // ignore: cast_nullable_to_non_nullable
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
      chatFailureOption: chatFailureOption == freezed
          ? _value.chatFailureOption
          : chatFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<ChatFailure>,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  const _$_HomeState(
      {required this.emailAddress,
      required this.searchedUserList,
      required this.searchStatus,
      required this.friendList,
      required this.friendListLoadStatus,
      required this.chatFailureOption})
      : super._();

  @override // required CompanyInfo companyInfo,
  final String emailAddress;
  @override // 可能要改Option，因為有可能為空
  final List<User> searchedUserList;
  @override
  final LoadStatus searchStatus;
  @override
  final List<User> friendList;
  @override
  final LoadStatus friendListLoadStatus;
  @override
  final Option<ChatFailure> chatFailureOption;

  @override
  String toString() {
    return 'HomeState(emailAddress: $emailAddress, searchedUserList: $searchedUserList, searchStatus: $searchStatus, friendList: $friendList, friendListLoadStatus: $friendListLoadStatus, chatFailureOption: $chatFailureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality()
                .equals(other.searchedUserList, searchedUserList) &&
            const DeepCollectionEquality()
                .equals(other.searchStatus, searchStatus) &&
            const DeepCollectionEquality()
                .equals(other.friendList, friendList) &&
            const DeepCollectionEquality()
                .equals(other.friendListLoadStatus, friendListLoadStatus) &&
            const DeepCollectionEquality()
                .equals(other.chatFailureOption, chatFailureOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(searchedUserList),
      const DeepCollectionEquality().hash(searchStatus),
      const DeepCollectionEquality().hash(friendList),
      const DeepCollectionEquality().hash(friendListLoadStatus),
      const DeepCollectionEquality().hash(chatFailureOption));

  @JsonKey(ignore: true)
  @override
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {required String emailAddress,
      required List<User> searchedUserList,
      required LoadStatus searchStatus,
      required List<User> friendList,
      required LoadStatus friendListLoadStatus,
      required Option<ChatFailure> chatFailureOption}) = _$_HomeState;
  const _HomeState._() : super._();

  @override // required CompanyInfo companyInfo,
  String get emailAddress;
  @override // 可能要改Option，因為有可能為空
  List<User> get searchedUserList;
  @override
  LoadStatus get searchStatus;
  @override
  List<User> get friendList;
  @override
  LoadStatus get friendListLoadStatus;
  @override
  Option<ChatFailure> get chatFailureOption;
  @override
  @JsonKey(ignore: true)
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
