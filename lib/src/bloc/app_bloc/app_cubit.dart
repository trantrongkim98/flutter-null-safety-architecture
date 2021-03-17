// ignore: prefer_single_quotes
import "package:flutter/material.dart";
// ignore: prefer_single_quotes
import "package:flutter_bloc/flutter_bloc.dart";
// ignore: prefer_single_quotes
import "package:flutterarchitecture/src/bloc/app_bloc/app_state.dart";
import 'package:flutterarchitecture/src/model/remote/user/sign_in.dart';
import 'package:flutterarchitecture/src/repository/user/user_repository.dart';
import 'package:flutterarchitecture/src/service/user/user_service.dart';

/// [AppCubit] this's Cubit of App
class AppCubit extends Cubit<AppState> {
  late UserRepository _repository;

  /// this is constructor of App cubit
  AppCubit(UserRepository userRepository) : super(AppState.initial()) {
    _repository = userRepository;
  }

  /// method switch theme of app
  void onSwitchTheme() {
    ThemeMode _theme =
        state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(state.copyWith(themeMode: _theme));
  }

  /// method change language of app
  void onChangeLanguage(String code) {}

  /// sign in
  void signIn(SignInRequest request) {
    _repository.signIn(request).then((value) {
      if (value.code == 0) {
        emit(AppState());
      }
    });
  }
}
