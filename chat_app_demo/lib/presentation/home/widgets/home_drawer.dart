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
              UserProfileAvatar(user: currentUser),
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
          ),
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
            leading: const Icon(Icons.settings),
            title: const Text('設定'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('介紹'),
            onTap: () {},
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
