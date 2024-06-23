import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app_theme.dart';
import 'package:todo_list_flutter/UI//home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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

