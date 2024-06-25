import 'package:flutter/material.dart';

class AppThemeData {
  Color lightPrimary = Colors.blueAccent;
  Color darkPrimary = Colors.lightBlueAccent;
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme(
      primary: Colors.blueAccent,
      onPrimary: Colors.green,
      secondary: Colors.white,
      onSecondary: Colors.white,
      background: Colors.white,
      error: Colors.red,
      onError: Colors.red,
      onSurface: Colors.grey,
      surface: Colors.white,
      onBackground: Colors.blueAccent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Color(0xFFDDE8D8),
    iconTheme: IconThemeData(size: 38),
    appBarTheme: AppBarTheme(
        // centerTitle: true,
        color: Colors.blueAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
        displaySmall: TextStyle(
            fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w400),
        displayMedium: TextStyle(
            fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w400),
        displayLarge: TextStyle(
            fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black26,
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Colors.lightBlueAccent,
      colorScheme: ColorScheme(
        primary: Colors.blueAccent,
        onPrimary: Colors.black,
        secondary: Colors.white,
        onSecondary: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        onSurface: Colors.grey,
        surface: Colors.white,
        onBackground: Colors.blueAccent,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.black54,
      iconTheme: IconThemeData(size: 38),
      appBarTheme: AppBarTheme(
          // centerTitle: true,
          color: Colors.lightBlueAccent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
          displaySmall: TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w400),
          displayMedium: TextStyle(
              fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w400),
          displayLarge: TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black26,
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white)
    ,floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.lightBlueAccent,
  ),);
}
