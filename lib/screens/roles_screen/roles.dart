import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/catalogo.dart';
import '../catalogo.dart';

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
  bool _isAdministradoraHighlighted = false;
  bool _isPersonalHighlighted = false;

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
    const Color primaryColor = Color(0xFF381C09);

    return Scaffold(
      backgroundColor: Colors.white,
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
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 40),

              // Opción: Administradora
              _buildRoleOption(
                title: 'Administradora',
                icon: Icons.person_rounded,
                isSelected: _selectedRole == 'Administradora',
                isHighlighted: _isAdministradoraHighlighted,
                onTap: () {
                  setState(() {
                    _selectedRole = 'Administradora';
                  });
                },
                onHighlightChanged: (isHighlighted) {
                  setState(() {
                    _isAdministradoraHighlighted = isHighlighted;
                  });
                },
                seedColor: primaryColor, // Color unificado
              ),
              const SizedBox(height: 20),

              // Opción: Personal
              _buildRoleOption(
                title: 'Personal',
                icon: Icons.person_outline_rounded,
                isSelected: _selectedRole == 'Personal',
                isHighlighted: _isPersonalHighlighted,
                onTap: () {
                  setState(() {
                    _selectedRole = 'Personal';
                  });
                },
                onHighlightChanged: (isHighlighted) {
                  setState(() {
                    _isPersonalHighlighted = isHighlighted;
                  });
                },
                seedColor: primaryColor, // Color unificado
              ),
              const Spacer(),

              // Botón Ingresar animado
              Center(
                child: GestureDetector(
                  onTapDown: (_) {
                    _animationController.forward();
                    setState(() {});
                  },
                  onTapUp: (_) {
                    _animationController.reverse();
                    setState(() {});
                    _handleIngresarTap();
                  },
                  onTapCancel: () {
                    _animationController.reverse();
                    setState(() {});
                  },
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 18),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withAlpha(77),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        'Ingresar',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
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
    required bool isSelected,
    required VoidCallback onTap,
    required Color seedColor,
    bool isHighlighted = false,
    ValueChanged<bool>? onHighlightChanged,
  }) {
    final Color backgroundColor = isHighlighted
        ? seedColor.withAlpha(204)
        : (isSelected ? seedColor : Colors.white);
    final Color contentColor =
        (isHighlighted || isSelected) ? Colors.white : seedColor;

    return InkWell(
      onTap: onTap,
      onHighlightChanged: onHighlightChanged,
      splashColor: seedColor.withAlpha(30),
      highlightColor: Colors.transparent, // Usamos nuestro propio efecto
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? seedColor : Colors.grey[300]!,
            width: 1.5,
          ),
          boxShadow: (isSelected || isHighlighted)
              ? [
                  BoxShadow(
                    color: seedColor.withAlpha(51),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.grey.withAlpha(25),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  )
                ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: contentColor,
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
