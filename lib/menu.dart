import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF4E342E); // Dark Brown

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NOVEDAD DEL BOLSO',
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.7),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Action for more options
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white.withOpacity(0.9),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                _createDrawerItem(
                  icon: Icons.person_outline,
                  text: 'PERFIL',
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 10),
                _createDrawerItem(
                  icon: Icons.sync_alt,
                  text: 'CAMBIO DE TIENDA',
                  primaryColor: primaryColor,
                ),
                const SizedBox(height: 10),
                _createDrawerItem(
                  icon: Icons.exit_to_app,
                  text: 'SALIR',
                  primaryColor: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1594223274512-ad4803739b7c?q=80&w=1887&auto=format&fit=crop'), // Placeholder bags
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido a la Tienda de Bolsos',
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required Color primaryColor,
  }) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.4),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Action for the item
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(icon, color: primaryColor, size: 30),
              const SizedBox(width: 20),
              Text(
                text,
                style: GoogleFonts.lato(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}