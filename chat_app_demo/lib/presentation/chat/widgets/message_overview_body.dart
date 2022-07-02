import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/chat/chat_cubit.dart';
import '../../../constants.dart';
import '../../../domain/chat/chat_message.dart';
import 'message_bubble.dart';

class MessageOverviewBody extends StatelessWidget {
  MessageOverviewBody({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listenWhen: (p, c) => p.sendedMessageId != c.sendedMessageId,
      listener: (context, state) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 10),
          curve: Curves.easeOut,
        );
      },
      builder: (context, state) {
        return BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return ListView.builder(
              controller: scrollController,
              itemCount: state.messageList.length,
              itemBuilder: ((context, index) {
                ChatMessage chatMessage = state.messageList[index];

                return chatMessage.fromId ==
                        context.read<AuthCubit>().state.user.userId
                    ? myMessage(chatMessage)
                    : otherMessage(chatMessage);
              }),
            );
          },
        );
      },
    );
  }

  Widget otherMessage(ChatMessage chatMessage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: kDefaultPadding / 2,
            bottom: kDefaultPadding / 2,
          ),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://post.greatist.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg'),
            backgroundColor: Colors.transparent,
          ),
        ),
        MessageBubble(
          chatMessage: chatMessage,
          isMyMessage: false,
        ),
      ],
    );
  }

  Widget myMessage(ChatMessage chatMessage) {
    return MessageBubble(
      chatMessage: chatMessage,
      isMyMessage: true,
    );
  }
}
