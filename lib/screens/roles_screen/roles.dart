import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/catalogo.dart';

import '../../Home/login.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  RolesScreenState createState() => RolesScreenState();
}

class RolesScreenState extends State<RolesScreen> {
  String? _selectedRole;

  void _handleIngresarTap() {
    if (_selectedRole != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CatalogoScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecciona un rol para continuar.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, // Elimina la sombra del AppBar
        backgroundColor: Colors.white, // Pone el fondo del AppBar en blanco
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5D4037)), // Ícono con color
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (context) => LoginScreen(),
              ),
            ); // Regresa a la pantalla anterior
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Column(
              children: [
                Text(
                  'Roles',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF5D4037),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 100,
                  height: 2,
                  color: const Color(0xFF5D4037),
                ),
              ],
            ),
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleOption(
                  title: 'Administrador',
                  icon: Icons.person_outline,
                  isSelected: _selectedRole == 'Administrador',
                  onTap: () {
                    setState(() {
                      _selectedRole = 'Administrador';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleOption(
                  title: 'Personal',
                  icon: Icons.person_outline,
                  isSelected: _selectedRole == 'Personal',
                  onTap: () {
                    setState(() {
                      _selectedRole = 'Personal';
                    });
                  },
                ),
              ],
            ),
            const Spacer(flex: 4),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.0),
                    const Color(0xFFC9A293).withOpacity(0.4),
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: _handleIngresarTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5D4037),
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'INGRESAR',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleOption({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF5F5F5) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF5D4037) : Colors.grey.shade300,
            width: isSelected ? 2 : 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
