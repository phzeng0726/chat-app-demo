import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/home/home_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../../domain/core/logger.dart';
import '../../../injection.dart';
import '../../core/widgets/load_status_screen.dart';
import '../../core/widgets/uesr_profile_avatar.dart';
import '../../routes/router.gr.dart';

class FriendsOverviewBody extends StatelessWidget {
  const FriendsOverviewBody({Key? key}) : super(key: key);

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
              serverError: (_) => FlutterI18n.translate(
                  context, "home.homeFailure.serverError"),
              unexpected: (_) =>
                  FlutterI18n.translate(context, "home.homeFailure.unexpected"),
              insufficientPermission: (_) => FlutterI18n.translate(
                  context, "home.homeFailure.insufficientPermission"),
              userNotExist: (_) => FlutterI18n.translate(
                  context, "home.homeFailure.userNotExist"),
            )).show(context);
          },
        );
      },
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return LoadStatusScreen(
              loadStatus: state.friendListLoadStatus,
              succeedScreen: state.friendList.isEmpty
                  ? Center(
                      child: Text(FlutterI18n.translate(
                          context, "home.friendsOverview.emptyFriends")),
                    )
                  : ListView.builder(
                      itemCount: state.friendList.length,
                      itemBuilder: ((context, index) {
                        User user = state.friendList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2),
                          child: ListTile(
                            onTap: () => getIt<RootRouter>().push(
                              ChatRoute(
                                otherUser: user,
                              ),
                            ),
                            leading: UserProfileAvatar(user: user),
                            title: Text(user.userName),
                          ),
                        );
                      }),
                    ),
            );
          },
        );
      },
    );
  }
}
