import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/chat/chat_cubit.dart';

class MessageEnterBox extends StatefulWidget {
  const MessageEnterBox({Key? key}) : super(key: key);

  @override
  State<MessageEnterBox> createState() => _MessageEnterBoxState();
}

class _MessageEnterBoxState extends State<MessageEnterBox> {
  late FocusNode focusNode;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          // autofocus: true,
          autocorrect: false,
          focusNode: focusNode,
          onSubmitted: (value) async {
            await context.read<ChatCubit>().sendMessage(value);
            controller.clear();
            focusNode.requestFocus();
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.chat),
            // suffixIcon: IconButton(
            //   onPressed: () =>
            //       context.read<ChatCubit>().sendMessage(controller.text),
            //   icon: const Icon(Icons.send),
            // ),
            hintText: '訊息',
          ),
        );
      },
    );
  }
}
