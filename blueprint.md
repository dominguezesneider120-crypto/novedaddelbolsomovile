<<<<<<< HEAD

# Blueprint de la Aplicación

## Visión General

Esta aplicación de Flutter proporcionará una experiencia de usuario moderna y atractiva, comenzando con una pantalla de inicio de sesión segura y bien diseñada. El objetivo es crear una base sólida que sea escalable para futuras características.

## Diseño y Estilo

La aplicación seguirá los principios de Material Design 3, con un enfoque en:

*   **Tipografía:** Uso de `google_fonts` para una jerarquía de texto clara y expresiva.
*   **Color:** Una paleta de colores vibrante generada a partir de un color semilla para mantener la consistencia.
*   **Componentes:** Elementos de la interfaz de usuario estilizados, como botones y campos de texto con sombras y bordes redondeados para una apariencia moderna.
*   **Fondo:** Un fondo con textura sutil o degradado para añadir profundidad y una sensación premium.

## Plan Actual: Creación de la Pantalla de Inicio de Sesión

### Pasos

1.  **Añadir Dependencias:**
    *   Agregar `google_fonts` a `pubspec.yaml` para acceder a una amplia biblioteca de tipografías.
2.  **Crear la Pantalla de Inicio de Sesión (`lib/login_screen.dart`):**
    *   Implementar un `StatelessWidget` para la estructura principal.
    *   Utilizar un `Scaffold` con un `Container` decorado para el fondo de color.
    *   Usar un `Center` con un `Column` para organizar los elementos verticalmente.
    *   **Nombre de la Marca:** Un `Text` widget estilizado con una fuente grande y en negrita de `google_fonts`.
    *   **Campos de Entrada:** Dos `TextField` widgets para el correo electrónico y la contraseña, decorados con `InputDecoration` para incluir hint text, iconos y bordes redondeados.
    *   **Botón de Inicio de Sesión:** Un `ElevatedButton` estilizado para que coincida con el tema de la aplicación.
3.  **Actualizar el Punto de Entrada (`lib/main.dart`):**
    *   Cambiar el `home` del `MaterialApp` para que apunte a `LoginScreen`.
    *   Configurar un `ThemeData` básico usando `ColorScheme.fromSeed` para establecer el estilo global.
=======
# Blueprint de la Aplicación de Bolsos

## Visión General

Esta aplicación es una tienda de bolsos simple que muestra una pantalla de bienvenida con un menú de navegación lateral. El objetivo es proporcionar una interfaz de usuario limpia, moderna y visualmente atractiva.

## Directrices de Diseño

### Paleta de Colores

- **Color Primario:** Marrón oscuro (`#4E342E`)
- **Color de Acento:** Blanco
- **Sombra:** Negro con opacidad

### Tipografía

- **Títulos de la Barra de Aplicaciones:** Oswald (de Google Fonts)
- **Texto del Cuerpo y del Menú:** Lato (de Google Fonts)

### Iconografía

- Se utilizan iconos de Material Design para la navegación y las acciones.

## Implementación Actual

### `pubspec.yaml`

```yaml
name: myapp
description: "A new Flutter project."
publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: ^3.9.0

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.3.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0

flutter:
  uses-material-design: true
```

### `lib/main.dart`

```dart
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
    const Color primaryColor = Color(0xFF4E342E); // Marrón Oscuro

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
              // Acción para más opciones
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
                'https://images.unsplash.com/photo-1594223274512-ad4803739b7c?q=80&w=1887&auto=format&fit=crop'), // Bolsos de ejemplo
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
          // Acción para el ítem
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
```

## Próximos Pasos

- Implementar la funcionalidad de navegación para los elementos del menú.
- Añadir una pantalla de perfil de usuario.
- Implementar la funcionalidad de cambio de tienda.
>>>>>>> dc794bf (icons)
