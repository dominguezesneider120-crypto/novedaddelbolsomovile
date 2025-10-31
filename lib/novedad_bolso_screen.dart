import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/catalogo.dart';

class NovedadBolsoScreen extends StatelessWidget {
  const NovedadBolsoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A2B1A),
        foregroundColor: Colors.white,
        title: Text(
          'NOVEDAD DEL BOLSO',
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF4A2B1A),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color(0xFF3E2211),
                ),
                child: Text(
                  'Menú',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildDrawerItem(icon: Icons.person_outline, text: 'PERFIL'),
              _buildDrawerItem(icon: Icons.sync, text: 'CAMBIO DE TIENDA'),
              _buildDrawerItem(icon: Icons.shopping_bag_outlined, text: 'STOCK'),
              _buildDrawerItem(icon: Icons.exit_to_app, text: 'SALIR'),
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760660013/bolsofondo_wwk2m9.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.45),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido a Novedad del Bolso',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CatalogoScreen()),
                    );
                  },
                  child: const Text('Ver Catálogo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 30),
      title: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      onTap: () {
        // Handle drawer item tap
      },
    );
  }
}
