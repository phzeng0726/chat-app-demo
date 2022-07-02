import 'package:another_flushbar/flushbar_helper.dart';
import 'package:chat_app_demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/home_cubit.dart';
import '../../../domain/auth/user.dart';
import '../../../domain/core/logger.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

class FriendsOverviewBody extends StatelessWidget {
  const FriendsOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (p, c) => p.chatFailureOption != c.chatFailureOption,
      listener: (context, state) {
        state.chatFailureOption.fold(
          () => null,
          (failure) {
            LoggerService.simple.i(failure);

            FlushbarHelper.createError(
                message: failure.map(
              serverError: (_) => '伺服器有問題，請稍候再試',
              unexpected: (_) => '未知的錯誤',
              insufficientPermission: (_) => '沒有權限',
              userNotExist: (_) => '查無此用戶',
            )).show(context);
          },
        );
      },
      builder: (context, state) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.friendListLoadStatus.map(
              initial: (_) => Container(),
              inProgress: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              succeed: (_) => state.friendList.isEmpty
                  ? const Center(
                      child: Text('您還沒有好友，快點加入好友吧！'),
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
                            leading: const CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  'https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg'),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(user.userName),
                          ),
                        );
                      }),
                    ),
              failed: (_) => const Center(
                child: Text('加載失敗'),
              ),
            );
          },
        );
      },
    );
  }
}
