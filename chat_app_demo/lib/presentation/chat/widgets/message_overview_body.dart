import 'package:chat_app_demo/application/chat/chat_cubit.dart';
import 'package:chat_app_demo/domain/chat/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageOverviewBody extends StatelessWidget {
  const MessageOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.messageList.length,
          itemBuilder: ((context, index) {
            ChatMessage chatMessage = state.messageList[index];
            return ListTile(
              leading: Text(chatMessage.createdTimeStamp.toReadableString()),
              title: Text(chatMessage.content),
              subtitle: Text(
                chatMessage.fromId,
              ),
            );
          }),
        );
      },
    );
  }
}
