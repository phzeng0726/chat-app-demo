import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/theme/theme_cubit.dart';
import '../../../constants.dart';
import '../../core/widgets/translation_helper.dart';

class LangrageSelectPage extends StatelessWidget {
  const LangrageSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listenWhen: (p, c) => p.currentLang != c.currentLang,
      listener: (context, state) async {
        await FlutterI18n.refresh(context, state.currentLang);
      },
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(tr(context, "home.drawer.setting.language")),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: localeMapList.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(localeMapList[index]['title']),
                    trailing:
                        state.currentLang == localeMapList[index]['locale']
                            ? Icon(
                                Icons.check_box,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    onTap: () => context
                        .read<ThemeCubit>()
                        .changeLanguage(localeMapList[index]['locale']),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
