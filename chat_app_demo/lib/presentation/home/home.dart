import 'package:chat_app_demo/application/theme/theme_cubit.dart';
import 'package:chat_app_demo/constants.dart';
import 'package:chat_app_demo/presentation/home/widgets/friends_overview_body.dart';
import 'package:chat_app_demo/presentation/home/widgets/home_drawer.dart';
import 'package:chat_app_demo/presentation/home/widgets/theme_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/home/home_cubit.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../domain/core/load_status.dart';
import '../../injection.dart';
import 'widgets/search_user_box.dart';
import 'widgets/search_user_overview_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt<IChatRepository>())..watchFriendListStarted(),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: const HomeDrawer(),
            appBar: AppBar(
              title: const Text('Chat App Demo'),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.face), text: '我的好友'),
                  Tab(icon: Icon(Icons.search), text: '搜尋')
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                FriendsOverviewBody(),
                SearchUserOverviewBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
