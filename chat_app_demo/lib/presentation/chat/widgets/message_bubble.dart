import 'package:chat_app_demo/application/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../domain/chat/chat_message.dart';

// NOTE: 參考資料
// https://stackoverflow.com/questions/66201124/right-aligning-message-timestamp-with-trailing-right-hand-side-of-flutter-messag/66365293#66365293

class MessageBubble extends StatelessWidget {
  final ChatMessage chatMessage;
  final bool isMyMessage;
  const MessageBubble({
    Key? key,
    required this.chatMessage,
    required this.isMyMessage,
  }) : super(key: key);

  Widget _buildTimeStamp({required Color color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          chatMessage.createdTimeStamp.toHourMinuteString(),
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildContent({
    required String text,
    required TextStyle style,
    required String reserve,
  }) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 60,
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final originalPainter = TextPainter(
            text: TextSpan(text: text, style: style),
            textDirection: TextDirection.ltr,
            textWidthBasis: TextWidthBasis.longestLine,
          )..layout(maxWidth: constraints.maxWidth);

          final reservePainter = TextPainter(
            text: TextSpan(text: text + reserve, style: style),
            textDirection: TextDirection.ltr,
            textWidthBasis: TextWidthBasis.longestLine,
          )..layout(maxWidth: constraints.maxWidth);

          final changeLine =
              reservePainter.width > originalPainter.width + 0.001 ||
                  reservePainter.height > originalPainter.height + 0.001;
          return Text(
            changeLine ? '$text\n' : text,
            style: style,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        context.read<ThemeCubit>().state.themeData == darkTheme;
    final MessageTheme messageTheme = isDarkTheme
        ? BubbleTheme().darkThemeBubble
        : BubbleTheme().lightThemeBubble;
    // return TextSized(
    //   text: chatMessage.content,
    // );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .7,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2.0,
                  blurRadius: 4.0,
                  offset: isMyMessage
                      ? const Offset(-2, 2)
                      : const Offset(2, 2), // changes position of shadow
                ),
              ],
              color: isMyMessage
                  ? messageTheme.myBubbleColor
                  : messageTheme.otherBubbleColor,
            ),
            child: Stack(
              children: [
                _buildContent(
                  text: chatMessage.content,
                  style: isMyMessage
                      ? messageTheme.myContentTextStyle
                      : messageTheme.otherContentTextStyle,
                  reserve: '\u202F',
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: _buildTimeStamp(
                      color: isMyMessage
                          ? messageTheme.myTimeStampColor
                          : messageTheme.otherTimeStampColor,
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

// class TextSized extends StatelessWidget {
//   final String text;
//   const TextSized({
//     Key? key,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = TextStyle(
//       fontSize: 30,
//       color: Colors.white,
//     );
//     final Size txtSize = _textSize(text, textStyle);

//     // This kind of use - meaningless. It's just an example.
//     return Container(
//       color: Colors.blueGrey,
//       width: txtSize.width,
//       height: txtSize.height,
//       child: Text(
//         text,
//         style: textStyle,
//         softWrap: false,
//         overflow: TextOverflow.clip,
//         // maxLines: 1,
//       ),
//     );
//   }

//   // Here it is!
//   Size _textSize(String text, TextStyle style) {
//     final TextPainter textPainter = TextPainter(
//         text: TextSpan(text: text, style: style),
//         maxLines: 1,
//         textDirection: TextDirection.ltr)
//       ..layout(minWidth: 0, maxWidth: double.infinity);
//     return textPainter.size;
//   }
// }
