import 'package:flutter/material.dart';
import 'package:myapp/splash_screen.dart';

void main() {
  runApp(const MyApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      home: const SplashScreen(),
    );
  }
}
