import 'package:chat_app_demo/application/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageEnterBox extends StatelessWidget {
  const MessageEnterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) =>
          context.read<ChatCubit>().chatMessageContentChanged(value),
      autocorrect: false,
      decoration:  InputDecoration(
        fillColor: Colors.blue,
        prefixIcon: const Icon(Icons.chat),
        suffixIcon: IconButton(
          onPressed: () => context.read<ChatCubit>().sendMessage(),
          icon: const Icon(Icons.send),
        ),
        hintText: '訊息',
      ),
    );
    // return BlocBuilder<HomeCubit, HomeState>(
    //   builder: (context, state) {
    //     return TextFormField(
    //       initialValue: state.emailAddress,
    //       onChanged: (value) =>
    //           context.read<HomeCubit>().searchUserChanged(value),
    //       autocorrect: false,
    //       decoration: const InputDecoration(
    //         prefixIcon: Icon(Icons.search),
    //         hintText: '請輸入要搜尋用戶的 Email 地址',
    //       ),
    //       onEditingComplete: () =>
    //           context.read<HomeCubit>().searchUserStarted(),
    //     );
    //   },
    // );
  }
}
