
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Novedad',
            style: GoogleFonts.playfairDisplay(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            'del bolso',
            style: GoogleFonts.playfairDisplay(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: const Color(0xFF381C09),
    );
  }
}
