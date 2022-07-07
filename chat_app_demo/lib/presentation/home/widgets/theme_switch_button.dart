import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/theme/theme_cubit.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () => context.read<ThemeCubit>().switchTheme(),
          icon: Icon(
            context.read<ThemeCubit>().state.themeData == darkTheme
                ? Icons.wb_sunny
                : Icons.brightness_2,
          ),
        );
      },
    );
  }
}
