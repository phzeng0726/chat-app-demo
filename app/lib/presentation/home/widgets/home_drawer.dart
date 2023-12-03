import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../../application/auth/auth_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../../injection.dart';
import '../../core/widgets/uesr_profile_avatar.dart';
import '../../routes/router.gr.dart';
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
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(context),
          ListTile(
              leading: const Icon(Icons.settings),
              title: Text(tr(context, "home.drawer.setting.title")),
              onTap: () => getIt<RootRouter>().push(const SettingRoute())),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(tr(context, "home.drawer.introduction.title")),
            onTap: () => getIt<RootRouter>().push(const IntroductionRoute()),
          ),
          ElevatedButton(
            onPressed: () => context.read<AuthCubit>().signedOut(),
            child: Text(tr(context, "home.drawer.logout")),
          )
        ],
      ),
    );
  }
}
