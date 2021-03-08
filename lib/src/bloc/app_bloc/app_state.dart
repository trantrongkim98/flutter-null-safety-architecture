// ignore: prefer_double_quotes
import 'package:equatable/equatable.dart';
// ignore: prefer_double_quotes
import 'package:flutter/material.dart';

/// [AppState] this is where of all the State for are application
class AppState extends Equatable {
  /// Contructor fo AppState
  AppState({
    this.themeMode = ThemeMode.light,
    this.locale = const Locale('vi', 'VN'),
  });

  /// [AppState.initial()] at where initial AppState Object
  factory AppState.initial() {
    return AppState();
  }

  /// [themeMode] the Theme of App
  final ThemeMode themeMode;

  /// [locale] the locale of App
  final Locale locale;

  /// [copyWith] this's a factory method to copy properties if it's changed
  AppState copyWith({ThemeMode? themeMode}) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  int get hashCode => this.themeMode.hashCode;

  @override
  List<Object?> get props => [this.themeMode];

  @override
  bool operator ==(Object other) {
    return super == other;
  }
}
