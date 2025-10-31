
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  RolesScreenState createState() => RolesScreenState();
}

class RolesScreenState extends State<RolesScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedRole;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    _animationController.forward().then((_) {
      _animationController.reverse();
      // Aquí puedes poner la lógica de navegación o login
      debugPrint('Rol seleccionado: $_selectedRole');
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primarySeedColor = Color.fromARGB(255, 94, 49, 12);

    return Scaffold(
      backgroundColor: const Color(0xFF381C09),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Roles',
                style: GoogleFonts.oswald(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 120, 120, 120),
                ),
              ),
              const SizedBox(height: 40),

              // Opción: Administradora
              _buildRoleOption(
                title: 'Administradora',
                icon: Icons.person_rounded,
                isSelected: _selectedRole == 'Administradora',
                onTap: () {
                  setState(() {
                    _selectedRole = 'Administradora';
                  });
                },
                seedColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              const SizedBox(height: 20),

              // Opción: Personal
              _buildRoleOption(
                title: 'Personal',
                icon: Icons.person_outline_rounded,
                isSelected: _selectedRole == 'Personal',
                onTap: () {
                  setState(() {
                    _selectedRole = 'Personal';
                  });
                },
                seedColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              const Spacer(),

              // Botón Ingresar animado
              Center(
                child: GestureDetector(
                  onTapDown: (_) => _animationController.forward(),
                  onTapUp: (_) => _animationController.reverse(),
                  onTapCancel: () => _animationController.reverse(),
                  onTap: _onButtonPressed,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 18),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: primarySeedColor.withAlpha(77),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        'Ingresar',
                        style: GoogleFonts.playfairDisplay(
                          color: const Color(0xFF381C09),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  Widget _buildRoleOption({
    required String title,
    required IconData icon,
    Color? iconColor,
    required bool isSelected,
    required VoidCallback onTap,
    required Color seedColor,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: seedColor.withAlpha(26),
      highlightColor: seedColor.withAlpha(13),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? seedColor.withAlpha(26) : Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? seedColor : Colors.grey[200]!,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: seedColor.withAlpha(51),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected
                  ? (iconColor ?? seedColor)
                  : (iconColor ?? Colors.grey[600]),
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
