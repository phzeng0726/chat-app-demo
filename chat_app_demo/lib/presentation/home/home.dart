import 'package:chat_app_demo/application/auth/auth_cubit.dart';
import 'package:chat_app_demo/application/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/home/home_cubit.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../injection.dart';
import 'widgets/friends_overview_body.dart';
import 'widgets/home_drawer.dart';
import 'widgets/search_user_overview_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(getIt<IChatRepository>())
            ..fetchFriendListStarted(
              user: context.read<AuthCubit>().state.user,
            ),
        ),
      ],
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
            body: BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (p, c) => p.user != c.user,
              listener: (context, state) {
                context
                    .read<HomeCubit>()
                    .fetchFriendListStarted(user: state.user);
              },
              builder: (context, state) {
                return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return const TabBarView(
                      children: [
                        FriendsOverviewBody(),
                        SearchUserOverviewBody(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
