import 'package:chat_app_demo/presentation/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'firebase_options.dart';
import 'injection.dart';
import 'presentation/core/app_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // // NOTE:
  // // getId && injectable 教學，主要是用在
  // // firestore_helpers.dart 跟 firebase_injectable_module.dart
  // // https://juejin.cn/post/7060525200139354148
  configureInjection(Environment.prod); // 沒有這行的話沒辦法用injection
  getIt.registerSingleton<RootRouter>(RootRouter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AppWidget());
}
