import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void switchTheme() {
    emit(
      state.copyWith(
          themeData: (state.themeData == darkTheme) ? lightTheme : darkTheme),
    );
    print(state.themeData);
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
