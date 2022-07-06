import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/home/home_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../../injection.dart';
import '../../core/widgets/uesr_profile_avatar.dart';
import '../../routes/router.gr.dart';
import 'search_user_box.dart';

class SearchUserOverviewBody extends StatelessWidget {
  const SearchUserOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(
        children: [
          const SearchUserBox(),
          Expanded(
            child: ListView.builder(
              itemCount: state.searchedUserList.length,
              itemBuilder: ((context, index) {
                User user = state.searchedUserList[index];

                bool isFriend = context
                    .read<AuthCubit>()
                    .state
                    .user
                    .friendIdList
                    .contains(user.userId);

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: ListTile(
                    onTap: () =>
                        getIt<RootRouter>().push(ChatRoute(otherUser: user)),
                    title: Text(user.userName),
                    leading: UserProfileAvatar(user: user),
                    trailing: ElevatedButton.icon(
                      onPressed: isFriend
                          ? null
                          : () => context
                              .read<HomeCubit>()
                              .inviteFriendPressed(otherUserId: user.userId),
                      label: Text(isFriend
                          ? FlutterI18n.translate(
                              context, "home.searchUserOverview.alreadyFriend")
                          : FlutterI18n.translate(
                              context, "home.searchUserOverview.addFriend")),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      );
    });
  }
}
