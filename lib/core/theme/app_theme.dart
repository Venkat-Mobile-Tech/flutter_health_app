import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xFF905CFF);
  static const Color backgroundColor = Color(0xFF905CFF);
  static const Color indicatorActiveColor = Color(0xFF666666);
  static const Color indicatorInactiveColor = Color(0xFFD9D9D9);
  static const Color chatInputBackgroundColor = Color(0xFFB4B4B4);
  static const Color systemMessageBackgroundColor = Color(0xFF535254);
  static const Color userMessageBackgroundColor = Color(0xFFFFFFFF);
  static const Color avatarColor = Color(0xFF353535);

  static const Color systemMessageTextColor = Colors.white;
  static const Color userMessageTextColor = Colors.black;

  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: chatInputBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
        ),
      );
}
