import 'package:another_flushbar/flushbar_helper.dart';
import 'package:chat_app_demo/domain/chat/i_chat_repository.dart';
import 'package:chat_app_demo/presentation/home/widgets/search_user_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/home_cubit.dart';
import '../../../constants.dart';
import '../../../domain/auth/user.dart';
import '../../../domain/core/logger.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

class SearchUserOverviewBody extends StatelessWidget {
  const SearchUserOverviewBody({Key? key}) : super(key: key);

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
        return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          return Column(
            children: [
              const SearchUserBox(),
              Expanded(
                child: ListView.builder(
                  itemCount: state.searchedUserList.length,
                  itemBuilder: ((context, index) {
                    User user = state.searchedUserList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
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
      },
    );
  }
}
