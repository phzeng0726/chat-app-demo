// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegisterFormStateTearOff {
  const _$RegisterFormStateTearOff();

  _RegisterFormState call(
      {required String emailAddress,
      required String password,
      required String checkPassword,
      required bool isSubmitting,
      required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      required bool isPWObscure,
      required bool validate}) {
    return _RegisterFormState(
      emailAddress: emailAddress,
      password: password,
      checkPassword: checkPassword,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
      isPWObscure: isPWObscure,
      validate: validate,
    );
  }
}

/// @nodoc
const $RegisterFormState = _$RegisterFormStateTearOff();

/// @nodoc
mixin _$RegisterFormState {
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get checkPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isPWObscure => throw _privateConstructorUsedError; // 密碼是否隱藏
  bool get validate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterFormStateCopyWith<RegisterFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterFormStateCopyWith<$Res> {
  factory $RegisterFormStateCopyWith(
          RegisterFormState value, $Res Function(RegisterFormState) then) =
      _$RegisterFormStateCopyWithImpl<$Res>;
  $Res call(
      {String emailAddress,
      String password,
      String checkPassword,
      bool isSubmitting,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      bool isPWObscure,
      bool validate});
}

/// @nodoc
class _$RegisterFormStateCopyWithImpl<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  _$RegisterFormStateCopyWithImpl(this._value, this._then);

  final RegisterFormState _value;
  // ignore: unused_field
  final $Res Function(RegisterFormState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? checkPassword = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isPWObscure = freezed,
    Object? validate = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      checkPassword: checkPassword == freezed
          ? _value.checkPassword
          : checkPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, String>>,
      isPWObscure: isPWObscure == freezed
          ? _value.isPWObscure
          : isPWObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RegisterFormStateCopyWith<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  factory _$RegisterFormStateCopyWith(
          _RegisterFormState value, $Res Function(_RegisterFormState) then) =
      __$RegisterFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String emailAddress,
      String password,
      String checkPassword,
      bool isSubmitting,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      bool isPWObscure,
      bool validate});
}

/// @nodoc
class __$RegisterFormStateCopyWithImpl<$Res>
    extends _$RegisterFormStateCopyWithImpl<$Res>
    implements _$RegisterFormStateCopyWith<$Res> {
  __$RegisterFormStateCopyWithImpl(
      _RegisterFormState _value, $Res Function(_RegisterFormState) _then)
      : super(_value, (v) => _then(v as _RegisterFormState));

  @override
  _RegisterFormState get _value => super._value as _RegisterFormState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? password = freezed,
    Object? checkPassword = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccessOption = freezed,
    Object? isPWObscure = freezed,
    Object? validate = freezed,
  }) {
    return _then(_RegisterFormState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      checkPassword: checkPassword == freezed
          ? _value.checkPassword
          : checkPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, String>>,
      isPWObscure: isPWObscure == freezed
          ? _value.isPWObscure
          : isPWObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RegisterFormState implements _RegisterFormState {
  const _$_RegisterFormState(
      {required this.emailAddress,
      required this.password,
      required this.checkPassword,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption,
      required this.isPWObscure,
      required this.validate});

  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final String checkPassword;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, String>> authFailureOrSuccessOption;
  @override
  final bool isPWObscure;
  @override // 密碼是否隱藏
  final bool validate;

  @override
  String toString() {
    return 'RegisterFormState(emailAddress: $emailAddress, password: $password, checkPassword: $checkPassword, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption, isPWObscure: $isPWObscure, validate: $validate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterFormState &&
            const DeepCollectionEquality()
                .equals(other.emailAddress, emailAddress) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.checkPassword, checkPassword) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality().equals(
                other.authFailureOrSuccessOption, authFailureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other.isPWObscure, isPWObscure) &&
            const DeepCollectionEquality().equals(other.validate, validate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailAddress),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(checkPassword),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(authFailureOrSuccessOption),
      const DeepCollectionEquality().hash(isPWObscure),
      const DeepCollectionEquality().hash(validate));

  @JsonKey(ignore: true)
  @override
  _$RegisterFormStateCopyWith<_RegisterFormState> get copyWith =>
      __$RegisterFormStateCopyWithImpl<_RegisterFormState>(this, _$identity);
}

abstract class _RegisterFormState implements RegisterFormState {
  const factory _RegisterFormState(
      {required String emailAddress,
      required String password,
      required String checkPassword,
      required bool isSubmitting,
      required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      required bool isPWObscure,
      required bool validate}) = _$_RegisterFormState;

  @override
  String get emailAddress;
  @override
  String get password;
  @override
  String get checkPassword;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption;
  @override
  bool get isPWObscure;
  @override // 密碼是否隱藏
  bool get validate;
  @override
  @JsonKey(ignore: true)
  _$RegisterFormStateCopyWith<_RegisterFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
