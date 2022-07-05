part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  ThemeState._();
  factory ThemeState({
    required ThemeData themeData,
    required Locale currentLang,
  }) = _ThemeState;

  factory ThemeState.initial() => ThemeState(
        themeData: lightTheme,
        currentLang: const Locale('zh' 'TW'),
      );
}

ThemeData get darkTheme => ThemeData(
      indicatorColor: const ColorScheme.dark().primary,
      colorScheme: const ColorScheme.dark(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
        },
      ),
    );

ThemeData get lightTheme => ThemeData(
      indicatorColor: const ColorScheme.light().primary,
      colorScheme: const ColorScheme.light(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
        },
      ),
    );

const TextTheme _textTheme = TextTheme(
  bodyText1: TextStyle(
    fontSize: 22,
    // color: customMagenta300,
  ),
  bodyText2: TextStyle(
    // color: customMagenta400,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    // backgroundColor: customBackgroundWhite,
  ),
  caption: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    // color: customMagenta900,
    // backgroundColor: customMagenta50,
  ),
  headline1: TextStyle(
    // color: customMagenta600,
    fontSize: 60,
    fontFamily: 'Allison',
    fontWeight: FontWeight.bold,
  ),
  headline2: TextStyle(
    // color: customMagenta400,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  ),
);
// ThemeData(
//     colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: Colors.yellow,
//       onPrimary: Colors.black,
//       // Colors that are not relevant to AppBar in LIGHT mode:
//       primaryVariant: Colors.grey,
//       secondary: Colors.grey,
//       secondaryVariant: Colors.grey,
//       onSecondary: Colors.grey,
//       background: Colors.grey,
//       onBackground: Colors.grey,
//       surface: Colors.grey,
//       onSurface: Colors.grey,
//       error: Colors.grey,
//       onError: Colors.grey,
//     ),
//   )

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

      // indicatorColor: const Color(0xFF6553D9),
      // snackBarTheme: const SnackBarThemeData(
      //   backgroundColor: Color(0xFF676767),
      //   actionTextColor: Colors.redAccent,
      // ),
      // textTheme: _textTheme,