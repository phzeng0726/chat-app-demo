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
        currentLang: localeMapList.first['locale'],
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

