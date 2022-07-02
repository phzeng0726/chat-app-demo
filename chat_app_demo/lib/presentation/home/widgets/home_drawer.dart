import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../core/widgets/uesr_profile_avatar.dart';
import 'theme_switch_button.dart';

class HomeDrawer extends StatelessWidget {
  final User currentUser;
  const HomeDrawer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  Widget _drawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserProfileAvater(user: currentUser),
              const ThemeSwitchButton(),
            ],
          ),
          const SizedBox(height: kDefaultHeightSize),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentUser.userName),
                Text(currentUser.emailAddress),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(context),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ElevatedButton(
            onPressed: () => context.read<AuthCubit>().signedOut(),
            child: const Text('登出'),
          )
        ],
      ),
    );
  }
}
