import 'package:flutter/material.dart';

class PantallaBolso extends StatelessWidget {
  const PantallaBolso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Bolso'),
      ),
      body: const Center(
        child: Text('Esta es la pantalla del bolso.'),
      ),
    );
  }
}
