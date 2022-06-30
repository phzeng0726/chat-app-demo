// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_in_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

  _SignInFormState call(
      {required String emailAddress,
      required String password,
      String? checkPassword,
      required bool isSubmitting,
      required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      required bool isPWObscure,
      required bool validate}) {
    return _SignInFormState(
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
const $SignInFormState = _$SignInFormStateTearOff();

/// @nodoc
mixin _$SignInFormState {
  String get emailAddress => throw _privateConstructorUsedError;
  String get password =>
      throw _privateConstructorUsedError; // required bool showErrorMessages,
  String? get checkPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isPWObscure => throw _privateConstructorUsedError; // 密碼是否隱藏
  bool get validate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInFormStateCopyWith<SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call(
      {String emailAddress,
      String password,
      String? checkPassword,
      bool isSubmitting,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      bool isPWObscure,
      bool validate});
}

/// @nodoc
class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

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
              as String?,
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
abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String emailAddress,
      String password,
      String? checkPassword,
      bool isSubmitting,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      bool isPWObscure,
      bool validate});
}

/// @nodoc
class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

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
    return _then(_SignInFormState(
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
              as String?,
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

class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState(
      {required this.emailAddress,
      required this.password,
      this.checkPassword,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption,
      required this.isPWObscure,
      required this.validate});

  @override
  final String emailAddress;
  @override
  final String password;
  @override // required bool showErrorMessages,
  final String? checkPassword;
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
    return 'SignInFormState(emailAddress: $emailAddress, password: $password, checkPassword: $checkPassword, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption, isPWObscure: $isPWObscure, validate: $validate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInFormState &&
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
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState(
      {required String emailAddress,
      required String password,
      String? checkPassword,
      required bool isSubmitting,
      required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      required bool isPWObscure,
      required bool validate}) = _$_SignInFormState;

  @override
  String get emailAddress;
  @override
  String get password;
  @override // required bool showErrorMessages,
  String? get checkPassword;
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
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
