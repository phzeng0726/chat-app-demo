import 'package:bubble/bubble.dart';
import 'package:chat_app_demo/application/auth/auth_cubit.dart';
import 'package:chat_app_demo/application/chat/chat_cubit.dart';
import 'package:chat_app_demo/constants.dart';
import 'package:chat_app_demo/domain/chat/chat_message.dart';
import 'package:chat_app_demo/presentation/chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageOverviewBody extends StatelessWidget {
  const MessageOverviewBody({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return ListView.builder(
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
  }
}
