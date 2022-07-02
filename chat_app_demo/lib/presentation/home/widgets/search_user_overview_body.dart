import 'package:chat_app_demo/domain/chat/i_chat_repository.dart';
import 'package:chat_app_demo/presentation/home/widgets/search_user_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/home_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

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
              itemCount: state.searchUserList.length,
              itemBuilder: ((context, index) {
                User user = state.searchUserList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                  child: ListTile(
                    onTap: () => getIt<RootRouter>().push(
                      ChatRoute(
                        otherUser: user,
                      ),
                    ),
                    title: Text(user.userName),
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<HomeCubit>()
                            .inviteFriendPressed(otherUserId: user.userId);
                      },
                      label: Text('成為好友'),
                      icon: Icon(Icons.add),
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
