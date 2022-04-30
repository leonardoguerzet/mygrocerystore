import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/pages/auth/sign_in_screen.dart';
import 'package:my_grocery_store/src/pages/splash/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
