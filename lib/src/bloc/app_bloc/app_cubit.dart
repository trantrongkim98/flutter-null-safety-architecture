// ignore: prefer_single_quotes
import "package:flutter/material.dart";
// ignore: prefer_single_quotes
import "package:flutter_bloc/flutter_bloc.dart";
// ignore: prefer_single_quotes
import "package:flutterarchitecture/src/bloc/app_bloc/app_state.dart";

/// [AppCubit] this's Cubit of App
class AppCubit extends Cubit<AppState> {
  /// this is constructor of App cubit
  AppCubit() : super(AppState.initial());

  /// method switch theme of app
  void onSwitchTheme() {
    ThemeMode _theme =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(state.copyWith(themeMode: _theme));
  }

  /// method change language of app
  void onChangeLanguage(String code) {}
}
