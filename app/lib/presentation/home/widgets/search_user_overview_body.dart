import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
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
                User currentUser = state.user;

                bool isFriend = currentUser.friendIdList.contains(user.userId);
                bool isMyself = currentUser.userId == user.userId;

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: ListTile(
                    onTap: () =>
                        getIt<RootRouter>().push(ChatRoute(otherUser: user)),
                    title: Text(user.userName),
                    leading: UserProfileAvatar(user: user),
                    trailing: ElevatedButton.icon(
                      onPressed: isFriend || isMyself
                          ? null
                          : () => context
                              .read<HomeCubit>()
                              .inviteFriendPressed(otherUserId: user.userId),
                      label: Text(isMyself
                          ? tr(context, "home.searchUserOverview.isMyself")
                          : isFriend
                              ? tr(context,
                                  "home.searchUserOverview.alreadyFriend")
                              : tr(context,
                                  "home.searchUserOverview.addFriend")),
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
