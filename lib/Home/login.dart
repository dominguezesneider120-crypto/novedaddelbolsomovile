import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/catalogo.dart';
import 'package:myapp/screens/roles_screen/roles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  /// Inicia sesión con Google y devuelve el usuario de Firebase
  Future<User?> signInWithGoogle(context) async {
    try {
      // Paso 1: mostrar el selector de cuentas de Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // usuario canceló el inicio

      // Paso 2: obtener los tokens de autenticación de Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Paso 3: crear las credenciales de Firebase con esos tokens
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Paso 4: autenticar con Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const CatalogoScreen(),
        ),
      );

      // Devuelve el usuario autenticado
      return userCredential.user;
    } catch (e) {
      print('Error al iniciar sesión con Google y Firebase: $e');
      return null;
    }
  }

  /// Cierra sesión tanto en Firebase como en Google
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final authService = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF432A19),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LA NOVEDAD',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'DEL BOLSO',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'INVENTARIO',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  final user = await authService.signInWithGoogle(context);
                  if (user != null) {
                    print(
                        'Usuario autenticado con Firebase: ${user.displayName}');
                    print('Email: ${user.email}');

                    // Ejemplo: ir a la pantalla de roles
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RolesScreen()),
                    );
                  } else {
                    print('Inicio de sesión cancelado o fallido');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Iniciar sesión con Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
