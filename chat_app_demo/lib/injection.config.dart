// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/auth/i_auth_facade.dart' as _i5;
import 'domain/chat/i_chat_repository.dart' as _i7;
import 'domain/user_profile/i_user_profile_repository.dart' as _i9;
import 'infrastructure/auth/auth_facade.dart' as _i6;
import 'infrastructure/chat/chat_repository.dart' as _i8;
import 'infrastructure/core/firebase_injectable_module.dart' as _i11;
import 'infrastructure/user_profile/user_profile_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.IAuthFacade>(() =>
      _i6.AuthFacade(get<_i3.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i7.IChatRepository>(
      () => _i8.ChatRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i9.IUserProfileRepository>(
      () => _i10.UserProfileRepository(get<_i4.FirebaseFirestore>()));
  return get;
}

class _$FirebaseInjectableModule extends _i11.FirebaseInjectableModule {}
