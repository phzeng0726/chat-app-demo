import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../application/auth/auth_cubit.dart';
import '../../application/home/home_cubit.dart';
import '../../domain/auth/user.dart';
import '../../domain/home/i_home_repository.dart';
import '../../injection.dart';
import '../core/widgets/tap_out_dismiss_keyboard.dart';
import 'widgets/friends_overview_body.dart';
import 'widgets/home_drawer.dart';
import 'widgets/search_user_overview_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (p, c) => p.failureOption != c.failureOption,
      listener: (context, state) {
        state.failureOption.fold(
          () => null,
          (failure) {
            FlushbarHelper.createError(
                message: failure.map(
              serverError: (_) => tr(context, "home.homeFailure.serverError"),
              unexpected: (_) => tr(context, "home.homeFailure.unexpected"),
              insufficientPermission: (_) =>
                  tr(context, "home.homeFailure.insufficientPermission"),
              userNotExist: (_) => tr(context, "home.homeFailure.userNotExist"),
            )).show(context);
          },
        );
      },
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: DefaultTabController(
                length: 2,
                child: TapOutDismissKeyboard(
                  child: Scaffold(
                    drawer: HomeDrawer(
                      currentUser: state.user,
                    ),
                    appBar: AppBar(
                      title: Text(tr(context, "home.title")),
                      centerTitle: true,
                      bottom: TabBar(
                        tabs: [
                          Tab(
                              icon: const Icon(Icons.face),
                              text: tr(context, "home.myFriends")),
                          Tab(
                              icon: const Icon(Icons.search),
                              text: tr(context, "home.search"))
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
          },
        );
      },
    );
  }
}
