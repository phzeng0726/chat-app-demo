import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../application/auth/auth_cubit.dart';
import '../../application/chat/chat_cubit.dart';
import '../../domain/auth/user.dart';
import '../../domain/chat/i_chat_repository.dart';
import '../../injection.dart';
import '../core/widgets/load_status_screen.dart';
import 'widgets/message_enter_box.dart';
import 'widgets/message_overview_body.dart';

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
          currentUserId: context.read<AuthCubit>().state.user.userId,
          otherUserId: otherUser.userId,
        ),
      child: BlocConsumer<ChatCubit, ChatState>(
        listenWhen: (p, c) => p.failureOption != c.failureOption,
        listener: (context, state) {
          state.failureOption.fold(
            () => null,
            (failure) {
              FlushbarHelper.createError(
                  message: failure.map(
                serverError: (_) => tr(context, "chat.chatFailure.serverError"),
                unexpected: (_) => tr(context, "chat.chatFailure.unexpected"),
                insufficientPermission: (_) =>
                    tr(context, "chat.chatFailure.insufficientPermission"),
              )).show(context);
            },
          );
        },
        builder: (context, state) {
          return BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(otherUser.userName),
                  centerTitle: true,
                ),
                body: LoadStatusScreen(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
