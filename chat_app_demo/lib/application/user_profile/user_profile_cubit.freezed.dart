// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserProfileStateTearOff {
  const _$UserProfileStateTearOff();

  _UserProfileState call(
      {required User user,
      required bool isUpdating,
      required Option<ChatFailure> chatFailureOption}) {
    return _UserProfileState(
      user: user,
      isUpdating: isUpdating,
      chatFailureOption: chatFailureOption,
    );
  }
}

/// @nodoc
const $UserProfileState = _$UserProfileStateTearOff();

/// @nodoc
mixin _$UserProfileState {
  User get user => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  Option<ChatFailure> get chatFailureOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileStateCopyWith<UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res>;
  $Res call(
      {User user, bool isUpdating, Option<ChatFailure> chatFailureOption});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  final UserProfileState _value;
  // ignore: unused_field
  final $Res Function(UserProfileState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? isUpdating = freezed,
    Object? chatFailureOption = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isUpdating: isUpdating == freezed
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      chatFailureOption: chatFailureOption == freezed
          ? _value.chatFailureOption
          : chatFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<ChatFailure>,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserProfileStateCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$UserProfileStateCopyWith(
          _UserProfileState value, $Res Function(_UserProfileState) then) =
      __$UserProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User user, bool isUpdating, Option<ChatFailure> chatFailureOption});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$UserProfileStateCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res>
    implements _$UserProfileStateCopyWith<$Res> {
  __$UserProfileStateCopyWithImpl(
      _UserProfileState _value, $Res Function(_UserProfileState) _then)
      : super(_value, (v) => _then(v as _UserProfileState));

  @override
  _UserProfileState get _value => super._value as _UserProfileState;

  @override
  $Res call({
    Object? user = freezed,
    Object? isUpdating = freezed,
    Object? chatFailureOption = freezed,
  }) {
    return _then(_UserProfileState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isUpdating: isUpdating == freezed
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      chatFailureOption: chatFailureOption == freezed
          ? _value.chatFailureOption
          : chatFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<ChatFailure>,
    ));
  }
}

/// @nodoc

class _$_UserProfileState extends _UserProfileState {
  const _$_UserProfileState(
      {required this.user,
      required this.isUpdating,
      required this.chatFailureOption})
      : super._();

  @override
  final User user;
  @override
  final bool isUpdating;
  @override
  final Option<ChatFailure> chatFailureOption;

  @override
  String toString() {
    return 'UserProfileState(user: $user, isUpdating: $isUpdating, chatFailureOption: $chatFailureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.isUpdating, isUpdating) &&
            const DeepCollectionEquality()
                .equals(other.chatFailureOption, chatFailureOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isUpdating),
      const DeepCollectionEquality().hash(chatFailureOption));

  @JsonKey(ignore: true)
  @override
  _$UserProfileStateCopyWith<_UserProfileState> get copyWith =>
      __$UserProfileStateCopyWithImpl<_UserProfileState>(this, _$identity);
}

abstract class _UserProfileState extends UserProfileState {
  const factory _UserProfileState(
      {required User user,
      required bool isUpdating,
      required Option<ChatFailure> chatFailureOption}) = _$_UserProfileState;
  const _UserProfileState._() : super._();

  @override
  User get user;
  @override
  bool get isUpdating;
  @override
  Option<ChatFailure> get chatFailureOption;
  @override
  @JsonKey(ignore: true)
  _$UserProfileStateCopyWith<_UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
