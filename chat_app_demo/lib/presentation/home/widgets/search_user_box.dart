import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/home/home_cubit.dart';

class SearchUserBox extends StatelessWidget {
  const SearchUserBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.emailAddress,
          onChanged: (value) =>
              context.read<HomeCubit>().searchUserChanged(value),
          autocorrect: false,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: FlutterI18n.translate(
                context, "home.searchUserOverview.searchBoxHint"),
          ),
          onEditingComplete: () =>
              context.read<HomeCubit>().searchUserStarted(),
        );
      },
    );
  }
}
