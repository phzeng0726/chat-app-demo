import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../domain/chat/chat_message.dart';
// https://stackoverflow.com/questions/66201124/right-aligning-message-timestamp-with-trailing-right-hand-side-of-flutter-messag/66365293#66365293
class MessageBubble extends StatelessWidget {
  final ChatMessage chatMessage;
  final bool isMyMessage;
  const MessageBubble({
    Key? key,
    required this.chatMessage,
    required this.isMyMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeStamp = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.access_time,
          size: 15,
          color: Colors.grey,
        ),
        Text(
          chatMessage.createdTimeStamp.toHourMinuteString(),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );

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
            color:
                isMyMessage ? Color.fromARGB(255, 136, 193, 240) : Colors.white,
          ),
          child: MessageBox(
            message: chatMessage.content,
            timeStamp: timeStamp,
          ),
        )
      ],
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({
    required this.message,
    required this.timeStamp,
    Key? key,
  }) : super(key: key);

  final String message;

  final Widget timeStamp;

  @override
  Widget build(BuildContext context) {
    // NOTE: \u202F => NARROW NO-BREAK SPACE
    return Stack(
      children: [
        _buildText(message, const TextStyle(fontSize: 20), '\u202F'),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: timeStamp,
          ),
        ),
      ],
    );
  }

  Widget _buildText(String text, TextStyle style, String reserve) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 60,
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final originalPainter = TextPainter(
            text: TextSpan(text: message, style: style),
            textDirection: TextDirection.ltr,
            textWidthBasis: TextWidthBasis.longestLine,
          )..layout(maxWidth: constraints.maxWidth);

          final reservePainter = TextPainter(
            text: TextSpan(text: message + reserve, style: style),
            textDirection: TextDirection.ltr,
            textWidthBasis: TextWidthBasis.longestLine,
          )..layout(maxWidth: constraints.maxWidth);

          final changeLine =
              reservePainter.width > originalPainter.width + 0.001 ||
                  reservePainter.height > originalPainter.height + 0.001;

          return Text(
            changeLine ? '$message\n' : message,
            style: style,
          );
        },
      ),
    );
  }
}
