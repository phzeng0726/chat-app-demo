import 'package:chat_app_demo/domain/auth/user.dart';
import 'package:chat_app_demo/presentation/chat/widgets/message_overview_body.dart';
import 'package:chat_app_demo/presentation/core/widgets/load_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/chat/chat_cubit.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../injection.dart';
import 'widgets/message_enter_box.dart';

class ChatPage extends StatelessWidget {
  final User otherUser;
  const ChatPage({
    Key? key,
    required this.otherUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt<IChatRepository>())
        ..init(
          fromId: context.read<AuthCubit>().state.user.userId,
          toId: otherUser.userId,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(otherUser.userName),
          centerTitle: true,
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return LoadStatusScreen(
              loadStatus: state.loadStatus,
              succeedScreen: Column(
                children: [
                  Expanded(
                    child: MessageOverviewBody(
                      otherUser: otherUser,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: MessageEnterBox(),
                  )
                ],
              ),
            );
            // return state.loadStatus.map(
            //   initial: (_) => const Center(),
            //   inProgress: (_) => const CircularProgressIndicator(),
            //   succeed: (_) {
            //     return Column(
            //       children: [
            //         Expanded(
            //           child: MessageOverviewBody(
            //             otherUser: otherUser,
            //           ),
            //         ),
            //         const Align(
            //           alignment: Alignment.bottomCenter,
            //           child: MessageEnterBox(),
            //         )
            //       ],
            //     );
            //   },
            //   failed: (_) => LoadStatusScreen(),
            // );
          },
        ),
      ),
    );
  }
}
