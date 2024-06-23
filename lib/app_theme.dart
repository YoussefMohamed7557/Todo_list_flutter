import 'package:flutter/material.dart';
class AppThemeData {
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
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white));

  // static final ThemeData darkTheme = ThemeData(
  //     primaryColor: darkPrimary,
  //     scaffoldBackgroundColor: Colors.transparent,
  //     appBarTheme: AppBarTheme(
  //         centerTitle: true,
  //         color: Colors.transparent,
  //         elevation: 0,
  //         iconTheme: IconThemeData(color: colorWhite)),
  //     textTheme: TextTheme(
  //         headline1: TextStyle(
  //             fontSize: 30, color: colorWhite, fontWeight: FontWeight.w700),
  //         subtitle1: TextStyle(
  //             fontSize: 20, color: colorWhite, fontWeight: FontWeight.w400)),
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       selectedItemColor: darkAccent,
  //       unselectedItemColor: Colors.white,
  //     ),
  //     bottomSheetTheme: BottomSheetThemeData(backgroundColor: darkPrimary),
  //     colorScheme: ColorScheme(
  //       primary: darkPrimary,
  //       onPrimary: colorWhite,
  //       secondary: darkAccent,
  //       onSecondary: Colors.black,
  //       background: darkPrimary,
  //       error: Colors.red,
  //       onError: Colors.red,
  //       onSurface: Colors.black,
  //       surface: Colors.white,
  //       onBackground: darkAccent,
  //       brightness: Brightness.light,
  //     ));
}
