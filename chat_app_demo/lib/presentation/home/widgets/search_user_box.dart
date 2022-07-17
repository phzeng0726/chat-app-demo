import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../../application/home/home_cubit.dart';
import '../../../domain/auth/auth_validator.dart';

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
          validator: (input) => input!.isValidEmail(context),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: tr(context, "home.searchUserOverview.searchBoxHint"),
          ),
          onEditingComplete: () =>
              context.read<HomeCubit>().searchUserStarted(),
        );
      },
    );
  }
}
