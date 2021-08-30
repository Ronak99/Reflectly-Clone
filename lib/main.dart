import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly_clone/splash_screens/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Quicksand",
      ),
      home: SplashScreen(),
    );
  }
}
