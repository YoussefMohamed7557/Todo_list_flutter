import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app_theme.dart';
import 'package:todo_list_flutter/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.rout_name,
      routes: {
        HomePage.rout_name:(context)=>HomePage(),
      },
      theme: AppThemeData.lightTheme,
    );
  }
}

