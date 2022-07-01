import 'package:chat_app_demo/presentation/chat/widgets/message_overview_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/chat/chat_cubit.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../injection.dart';
import 'widgets/message_enter_box.dart';

class ChatPage extends StatelessWidget {
  final String toUserId;
  const ChatPage({
    Key? key,
    required this.toUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(getIt<IChatRepository>())
        ..init(
          fromId: context.read<AuthCubit>().state.user.userId,
          toId: toUserId,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(toUserId),
          centerTitle: true,
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return state.loadStatus.map(
              initial: (_) => const Center(),
              inProgress: (_) => const CircularProgressIndicator(),
              succeed: (_) {
                return Column(
                  children: const [
                    Expanded(
                      child: MessageOverviewBody(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MessageEnterBox(),
                    )
                    // const SearchUserBox(),
                    // if (state.searchStatus == const LoadStatus.initial()) ...[
                    //   const Text('聊天列表'),
                    // ] else if (state.searchStatus == const LoadStatus.failed()) ...[
                    //   const Text('查無用戶'),
                    // ] else ...[
                    //   const SearchUserOverview(),
                    // ]
                  ],
                );
              },
              failed: (_) => const Center(
                child: Text('加載失敗'),
              ),
            );
          },
        ),
      ),
    );
  }
}
