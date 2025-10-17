
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4E342E), // Dark brown
        title: Text(
          'NOVEDAD DEL BOLSO',
          style: GoogleFonts.oswald(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Handle more options
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF5D4037), // Lighter brown for drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF4E342E),
                ),
                child: Text(
                  'Menu',
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              _buildDrawerItem(
                icon: Icons.person_outline,
                text: 'PERFIL',
                onTap: () => Navigator.pop(context),
              ),
              _buildDrawerItem(
                icon: Icons.sync,
                text: 'CAMBIO DE TIENDA',
                onTap: () => Navigator.pop(context),
              ),
              _buildDrawerItem(
                icon: Icons.exit_to_app,
                text: 'SALIR',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/fotos-premium/bolsos-colgando-tienda_1025343-26463.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuRow(
                icon: Icons.person_outline,
                label: 'PERFIL',
                onTap: () {},
              ),
              const SizedBox(height: 40),
              _buildMenuRow(
                icon: Icons.sync,
                label: 'CAMBIO DE TIENDA',
                onTap: () {},
              ),
              const SizedBox(height: 40),
              _buildMenuRow(
                icon: Icons.exit_to_app,
                label: 'SALIR',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: GoogleFonts.roboto(color: Colors.white)),
      onTap: onTap,
    );
  }

  Widget _buildMenuRow({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF4E342E).withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 20),
          Container(
            height: 60,
            width: 4,
            color: Colors.white.withOpacity(0.7),
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.7),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
