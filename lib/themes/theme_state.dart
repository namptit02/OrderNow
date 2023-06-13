// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum ThemeMode {
  primary,
  noel,
}

class ThemeState {
  final ThemeMode themeData;
  ThemeState({
    required this.themeData,
  });

  ThemeState copyWith({
    ThemeMode? themeData,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
    );
  }
}

class ThemeData {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final ThemeMode themeMode;
  ThemeData({
    required this.primaryColor,
    required this.secondaryColor,
    required this.textColor,
    required this.themeMode,
  });
  factory ThemeData.primaryMode() {
    return ThemeData(
        primaryColor: const Color(0xff27374D),
        secondaryColor: const Color(0xff9DB2BF),
        textColor: const Color(0xffDDE6ED),
        themeMode: ThemeMode.primary);
  }
  factory ThemeData.noelMode() {
    return ThemeData(
        primaryColor: const Color(0xffB70404),
        secondaryColor: const Color(0xffF79327),
        textColor: const Color(0xffFFE569),
        themeMode: ThemeMode.noel);
  }
}
