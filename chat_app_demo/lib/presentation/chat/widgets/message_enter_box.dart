import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/chat/chat_cubit.dart';

// NOTE: bloc 的作者比較建議如果要用clear的話，直接用TextEditingController()，而不是bloc 配 OnChange
// https://github.com/felangel/bloc/issues/3231#issuecomment-1044715248
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
          minLines: 1,
          maxLines: 5,
          focusNode: focusNode,
          onSubmitted: (value) async {
            await context.read<ChatCubit>().sendMessage(value);
            controller.clear();
            focusNode.requestFocus();
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.chat),
            suffixIcon: IconButton(
              onPressed: () async {
                await context.read<ChatCubit>().sendMessage(controller.text);
                controller.clear();
                focusNode.requestFocus();
              },
              icon: const Icon(Icons.send),
            ),
            hintText: '訊息',
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
