import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/chat/chat_cubit.dart';
import '../../core/widgets/image_picker_bottom_sheet.dart';

// NOTE: bloc 的作者比較建議如果要用clear的話，直接用TextEditingController()，而不是bloc 配 OnChange
// https://github.com/felangel/bloc/issues/3231#issuecomment-1044715248
class MessageEnterBox extends StatefulWidget {
  const MessageEnterBox({Key? key}) : super(key: key);

  @override
  State<MessageEnterBox> createState() => _MessageEnterBoxState();
}

class _MessageEnterBoxState extends State<MessageEnterBox> {
  late FocusNode focusNode;
  late bool isBoxEmpty = true;
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Column(
          children: [
            TextField(
              controller: _inputController,
              autocorrect: false,
              minLines: 1,
              maxLines: 5,
              focusNode: focusNode,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return ImagePickerBottomSheet(
                          firstTileOnTap: () async {
                            context.read<ChatCubit>().sendImageByGallery();
                            context.router.pop();
                          },
                          secondTileOnTap: () async {
                            context.read<ChatCubit>().sendImageByCamera();
                            context.router.pop();
                          },
                        );
                      }),
                  icon: const Icon(Icons.photo_camera_back),
                ), // 傳照片
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _inputController,
                  builder: (context, value, child) {
                    return IconButton(
                      onPressed: value.text.isNotEmpty
                          ? () async {
                              context
                                  .read<ChatCubit>()
                                  .sendMessage(_inputController.text);
                              focusNode.requestFocus();
                              _inputController.clear();
                            }
                          : null,
                      icon: const Icon(Icons.send),
                    );
                  },
                ),
                hintText: FlutterI18n.translate(context, "chat.messageBoxHint"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
