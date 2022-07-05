import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/user_profile_edit/user_profile_edit_cubit.dart';
import '../../domain/home/i_home_repository.dart';
import '../../domain/auth/user.dart';
import '../../injection.dart';

class UserProfileEditPage extends StatelessWidget {
  final String editItemTitle;
  final String itemString;
  final Widget textFormFieldWidget;
  const UserProfileEditPage({
    Key? key,
    required this.editItemTitle,
    required this.itemString,
    required this.textFormFieldWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = context.read<AuthCubit>().state.user;

    return BlocProvider(
      create: (context) => UserProfileEditCubit(
        getIt<IHomeRepository>(),
      )..init(user: user),
      child: BlocBuilder<UserProfileEditCubit, UserProfileEditState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(editItemTitle),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<UserProfileEditCubit>().updateUserProfile();
                    context.router.pop();
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: Column(
              children: [
                textFormFieldWidget,
              ],
            ),
          );
        },
      ),
    );
  }
}
