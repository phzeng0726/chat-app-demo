import 'package:flutter/material.dart';

class BubbleTheme {
  MessageTheme get darkThemeBubble => MessageTheme(
        myBubbleColor: const ColorScheme.dark().primary.withOpacity(0.6),
        myTimeStampColor: const ColorScheme.dark().primary.withOpacity(0.8),
        myContentTextStyle: const TextStyle(fontSize: 18.0),
        otherBubbleColor:
            const Color.fromARGB(255, 164, 149, 231).withOpacity(0.6),
        otherTimeStampColor:
            const Color.fromARGB(255, 164, 149, 231).withOpacity(0.9),
        otherContentTextStyle: const TextStyle(fontSize: 18.0),
      );

  MessageTheme get lightThemeBubble => MessageTheme(
        myBubbleColor: const ColorScheme.light().primary.withOpacity(0.6),
        myTimeStampColor: const ColorScheme.light().primary.withOpacity(0.8),
        myContentTextStyle: const TextStyle(fontSize: 18.0),
        otherBubbleColor:
            const Color.fromARGB(255, 164, 149, 231).withOpacity(0.6),
        otherTimeStampColor:
            const Color.fromARGB(255, 164, 149, 231).withOpacity(0.9),
        otherContentTextStyle: const TextStyle(fontSize: 18.0),
      );
}

class MessageTheme {
  final Color myBubbleColor;
  final Color myTimeStampColor;
  final TextStyle myContentTextStyle;

  final Color otherBubbleColor;
  final Color otherTimeStampColor;
  final TextStyle otherContentTextStyle;

  MessageTheme({
    required this.myBubbleColor,
    required this.myTimeStampColor,
    required this.myContentTextStyle,
    required this.otherBubbleColor,
    required this.otherTimeStampColor,
    required this.otherContentTextStyle,
  });
}
