
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF381C09),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Novedad',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w600, // SemiBold
                      ),
                    ),
                    Text(
                      'del bolso',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w600, // SemiBold
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                _buildTextField(
                  context,
                  icon: Icons.person,
                  hintText: 'Usuario',
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  context,
                  icon: Icons.lock,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF381C09),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 15,
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'ENTRAR',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
