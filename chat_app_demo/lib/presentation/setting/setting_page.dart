import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../application/theme/theme_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listenWhen: (p, c) => p.currentLang != c.currentLang,
      listener: (context, state) async {
        await FlutterI18n.refresh(context, state.currentLang);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(FlutterI18n.translate(context, "setting.language")),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              ListTile(
                title: const Text('繁體中文 (台灣)'),
                onTap: () => context.read<ThemeCubit>().changeLanguage(
                      const Locale('zh', 'TW'),
                    ),
              ),
              ListTile(
                title: const Text('English (US)'),
                onTap: () => context.read<ThemeCubit>().changeLanguage(
                      const Locale('en', 'US'),
                    ),
              ),
            ],
          )),
    );
  }
}
