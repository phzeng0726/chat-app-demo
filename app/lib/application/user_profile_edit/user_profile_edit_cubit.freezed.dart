// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserProfileEditStateTearOff {
  const _$UserProfileEditStateTearOff();

  _UserProfileEditState call(
      {required User user,
      required bool isUpdating,
      required bool isUploadingImage,
      required Option<HomeFailure> failureOption}) {
    return _UserProfileEditState(
      user: user,
      isUpdating: isUpdating,
      isUploadingImage: isUploadingImage,
      failureOption: failureOption,
    );
  }
}

/// @nodoc
const $UserProfileEditState = _$UserProfileEditStateTearOff();

/// @nodoc
mixin _$UserProfileEditState {
  User get user => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isUploadingImage => throw _privateConstructorUsedError;
  Option<HomeFailure> get failureOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileEditStateCopyWith<UserProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileEditStateCopyWith<$Res> {
  factory $UserProfileEditStateCopyWith(UserProfileEditState value,
          $Res Function(UserProfileEditState) then) =
      _$UserProfileEditStateCopyWithImpl<$Res>;
  $Res call(
      {User user,
      bool isUpdating,
      bool isUploadingImage,
      Option<HomeFailure> failureOption});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserProfileEditStateCopyWithImpl<$Res>
    implements $UserProfileEditStateCopyWith<$Res> {
  _$UserProfileEditStateCopyWithImpl(this._value, this._then);

  final UserProfileEditState _value;
  // ignore: unused_field
  final $Res Function(UserProfileEditState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? isUpdating = freezed,
    Object? isUploadingImage = freezed,
    Object? failureOption = freezed,
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
      isUploadingImage: isUploadingImage == freezed
          ? _value.isUploadingImage
          : isUploadingImage // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOption: failureOption == freezed
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<HomeFailure>,
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
abstract class _$UserProfileEditStateCopyWith<$Res>
    implements $UserProfileEditStateCopyWith<$Res> {
  factory _$UserProfileEditStateCopyWith(_UserProfileEditState value,
          $Res Function(_UserProfileEditState) then) =
      __$UserProfileEditStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {User user,
      bool isUpdating,
      bool isUploadingImage,
      Option<HomeFailure> failureOption});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$UserProfileEditStateCopyWithImpl<$Res>
    extends _$UserProfileEditStateCopyWithImpl<$Res>
    implements _$UserProfileEditStateCopyWith<$Res> {
  __$UserProfileEditStateCopyWithImpl(
      _UserProfileEditState _value, $Res Function(_UserProfileEditState) _then)
      : super(_value, (v) => _then(v as _UserProfileEditState));

  @override
  _UserProfileEditState get _value => super._value as _UserProfileEditState;

  @override
  $Res call({
    Object? user = freezed,
    Object? isUpdating = freezed,
    Object? isUploadingImage = freezed,
    Object? failureOption = freezed,
  }) {
    return _then(_UserProfileEditState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isUpdating: isUpdating == freezed
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadingImage: isUploadingImage == freezed
          ? _value.isUploadingImage
          : isUploadingImage // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOption: failureOption == freezed
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<HomeFailure>,
    ));
  }
}

/// @nodoc

class _$_UserProfileEditState extends _UserProfileEditState {
  const _$_UserProfileEditState(
      {required this.user,
      required this.isUpdating,
      required this.isUploadingImage,
      required this.failureOption})
      : super._();

  @override
  final User user;
  @override
  final bool isUpdating;
  @override
  final bool isUploadingImage;
  @override
  final Option<HomeFailure> failureOption;

  @override
  String toString() {
    return 'UserProfileEditState(user: $user, isUpdating: $isUpdating, isUploadingImage: $isUploadingImage, failureOption: $failureOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileEditState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.isUpdating, isUpdating) &&
            const DeepCollectionEquality()
                .equals(other.isUploadingImage, isUploadingImage) &&
            const DeepCollectionEquality()
                .equals(other.failureOption, failureOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(isUpdating),
      const DeepCollectionEquality().hash(isUploadingImage),
      const DeepCollectionEquality().hash(failureOption));

  @JsonKey(ignore: true)
  @override
  _$UserProfileEditStateCopyWith<_UserProfileEditState> get copyWith =>
      __$UserProfileEditStateCopyWithImpl<_UserProfileEditState>(
          this, _$identity);
}

abstract class _UserProfileEditState extends UserProfileEditState {
  const factory _UserProfileEditState(
      {required User user,
      required bool isUpdating,
      required bool isUploadingImage,
      required Option<HomeFailure> failureOption}) = _$_UserProfileEditState;
  const _UserProfileEditState._() : super._();

  @override
  User get user;
  @override
  bool get isUpdating;
  @override
  bool get isUploadingImage;
  @override
  Option<HomeFailure> get failureOption;
  @override
  @JsonKey(ignore: true)
  _$UserProfileEditStateCopyWith<_UserProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
