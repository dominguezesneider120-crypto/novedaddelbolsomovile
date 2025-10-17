import 'package:flutter/material.dart';
import 'package:myapp/novedad_bolso_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novedad del Bolso',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const NovedadBolsoScreen(),
    );
  }
}
