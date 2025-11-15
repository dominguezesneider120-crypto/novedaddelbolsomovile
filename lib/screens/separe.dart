import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SepareScreen extends StatelessWidget {
  const SepareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'SEPARE',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5D4037), // Brown from catalogo
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildSectionTitle('INFORMACIÓN DEL CLIENTE'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Nombre', icon: Icons.person_outline),
              const SizedBox(height: 15),
              _buildTextField(label: 'Apellido', icon: Icons.person_outline),
              const SizedBox(height: 15),
              _buildTextField(label: 'Teléfono', icon: Icons.phone_outlined),
              const SizedBox(height: 30),
              _buildSectionTitle('DETALLES DEL PRODUCTO'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Producto', icon: Icons.inventory_2_outlined),
              const SizedBox(height: 15),
              _buildTextField(label: 'Código', icon: Icons.code),
              const SizedBox(height: 30),
              _buildSectionTitle('INFORMACIÓN FINANCIERA'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Precio', icon: Icons.attach_money, initialValue: '0.00'),
              const SizedBox(height: 15),
              _buildTextField(label: 'Abono', icon: Icons.money_off, initialValue: '0.00'),
              const SizedBox(height: 15),
              _buildTextField(label: 'Resta', icon: Icons.file_upload_outlined, initialValue: '0.00'),
              const SizedBox(height: 30),
              _buildTextField(
                label: 'Fecha',
                icon: Icons.calendar_today_outlined,
                initialValue: '14/11/2025',
                suffixIcon: Icons.calendar_month_outlined,
                readOnly: true,
                onTap: () {
                  // Handle date picker logic here
                },
              ),
              const SizedBox(height: 15),
              _buildTextField(label: 'Estado', icon: Icons.history_toggle_off_outlined, initialValue: 'ACT - CAN - VENC'),
              const SizedBox(height: 15),
              _buildTextField(label: 'Ubicación', icon: Icons.location_on_outlined),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5D4037), // Brown from catalogo
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                  ),
                  child: Text(
                    'Guardar',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: const Color(0xFF5D4037), // Brown from catalogo
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    String? initialValue,
    IconData? suffixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      onTap: onTap,
      style: GoogleFonts.roboto(),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.roboto(color: Colors.grey[700]),
        prefixIcon: Icon(icon, color: const Color(0xFF5D4037), size: 20),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: const Color(0xFF5D4037), size: 20) : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF5D4037), width: 2.0),
        ),
      ),
    );
  }
}
