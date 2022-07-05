import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/home/home_cubit.dart';
import '../../domain/auth/user.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../injection.dart';
import 'widgets/friends_overview_body.dart';
import 'widgets/home_drawer.dart';
import 'widgets/search_user_overview_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 記得用watch而不是read
    final User currentUser = context.watch<AuthCubit>().state.user;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(getIt<IChatRepository>())
            ..fetchFriendListStarted(
              user: currentUser,
            ),
        ),
      ],
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: HomeDrawer(
              currentUser: currentUser,
            ),
            appBar: AppBar(
              title: Text(FlutterI18n.translate(context, "home.title")),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                      icon: const Icon(Icons.face),
                      text: FlutterI18n.translate(context, "home.myFriends")),
                  Tab(
                      icon: const Icon(Icons.search),
                      text: FlutterI18n.translate(context, "home.search"))
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
