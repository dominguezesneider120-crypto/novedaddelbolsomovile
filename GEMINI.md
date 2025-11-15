# **Pautas de Desarrollo de IA para Flutter en Firebase Studio**

Estas pautas definen los principios operativos y las capacidades de un agente de IA (por ejemplo, Gemini) que interactúa con proyectos de Flutter dentro del entorno de Firebase Studio. El objetivo es permitir un flujo de trabajo de diseño y desarrollo de aplicaciones eficiente, automatizado y resistente a errores.

## **Conocimiento del Entorno y Contexto**

La IA opera dentro del entorno de desarrollo de Firebase Studio, que proporciona un IDE basado en Code OSS con una profunda integración para los servicios de Flutter y Firebase.

*   **Estructura del Proyecto:** La IA asume una estructura de proyecto estándar de Flutter. El punto de entrada principal de la aplicación es típicamente `lib/main.dart`.
*   **Configuración de dev.nix:**
    *   El archivo `.idx/dev.nix` es la fuente declarativa de verdad para el entorno del espacio de trabajo. La IA comprende su papel en la definición de:
        *   Herramientas de sistema requeridas (por ejemplo, `pkgs.flutter`, `pkgs.dart`).
        *   Extensiones del IDE.
        *   Variables de entorno.
        *   Comandos de inicio (`idx.workspace.onStart`).
    *   La IA debe aprovechar `dev.nix` para garantizar la coherencia del entorno y para configurar automáticamente las herramientas necesarias o verificar su presencia.
*   **Servidor de Vista Previa:**
    *   Firebase Studio proporciona un servidor de vista previa en ejecución (para web y emuladores de Android) con capacidades de recarga en caliente automática (`idx.previews.enable = true`; típicamente configurado por defecto).
    *   La IA monitoreará continuamente la salida del servidor de vista previa (por ejemplo, registros de la consola, mensajes de error, renderizado visual) para obtener retroalimentación en tiempo real sobre los cambios.
    *   Para cambios estructurales significativos, actualizaciones de dependencias o problemas persistentes, la IA debe activar una Recarga Manual Completa o un Reinicio Forzado del entorno de vista previa según sea necesario.
*   **Integración con Firebase:** La IA reconoce los patrones estándar de integración de Firebase en Flutter, incluido el uso de `firebase_options.dart` generado por `flutterfire configure`, y las interacciones con varios SDK de Firebase.

## **Modificación de Código y Gestión de Dependencias**

La IA está facultada para modificar la base de código de Flutter y gestionar sus dependencias de forma autónoma en función de las solicitudes del usuario y los problemas detectados. La IA es creativa y anticipa características que el usuario podría necesitar incluso si no se solicitan explícitamente.

*   **Asunción del Código Principal:** Cuando un usuario solicita un cambio (por ejemplo, "Añade un botón para navegar a una nueva pantalla"), la IA se centrará principalmente en modificar el código Dart. Se asume que `lib/main.dart` es el punto de entrada principal, y la IA inferirá otros archivos relevantes (por ejemplo, creando nuevos archivos de widgets, actualizando `pubspec.yaml`).
*   **Gestión de Paquetes:** Si una nueva característica requiere un paquete externo, la IA identificará el paquete más adecuado y estable de pub.dev.
    *   Para agregar una dependencia regular, ejecutará `flutter pub add <nombre_del_paquete>`.
    *   Para agregar una dependencia de desarrollo (por ejemplo, para pruebas o generación de código), ejecutará `flutter pub add dev:<nombre_del_paquete>`.
*   **Generación de Código (build_runner):**
    1.  Cuando un cambio introduce la necesidad de generación de código (por ejemplo, para clases `freezed`, modelos `json_serializable` o `riverpod_generator`), la IA:
        1.  Se asegurará de que `build_runner` esté en las `dev_dependencies` en `pubspec.yaml`.
        2.  Ejecutará automáticamente `dart run build_runner build --delete-conflicting-outputs` para generar los archivos necesarios después de las modificaciones de código que lo requieran.
*   **Calidad del Código:** La IA tiene como objetivo adherirse a las mejores prácticas de Flutter/Dart, incluyendo:
    *   Estructura de código limpia y separación de conceptos (por ejemplo, lógica de la interfaz de usuario separada de la lógica de negocio).
    *   Convenciones de nomenclatura significativas y coherentes.
    *   Uso efectivo de constructores y widgets `const` para la optimización del rendimiento.
    *   Soluciones de gestión de estado apropiadas (por ejemplo, Provider).
    *   Evitar cálculos costosos u operaciones de E/S directamente dentro de los métodos `build`.
    *   Uso adecuado de `async/await` para operaciones asíncronas con un manejo robusto de errores.

## **Detección y Corrección Automatizada de Errores**

Una función crítica de la IA es monitorear y resolver errores continuamente de forma automática para mantener un estado de la aplicación ejecutable y correcto.

*   **Comprobaciones Post-Modificación:** Después de *cada* modificación del código (incluida la adición de paquetes, la ejecución de la generación de código o la modificación de archivos existentes), la IA:
    1.  Monitoreará los diagnósticos del IDE (panel de problemas) y la salida del terminal (de `flutter run`, `flutter analyze`) en busca de errores de compilación, advertencias del análisis de Dart y excepciones en tiempo de ejecución.
    2.  Comprobará la salida del servidor de vista previa en busca de problemas de renderizado, bloqueos de la aplicación o comportamiento inesperado.
*   **Corrección Automática de Errores:** La IA intentará corregir automáticamente los errores detectados. Esto incluye, pero no se limita a:
    *   Errores de sintaxis en el código Dart.
    *   Incompatibilidades de tipo y violaciones de seguridad nula.
    *   Importaciones no resueltas o referencias a paquetes faltantes.
    *   Violaciones de las reglas de linting (la IA ejecutará automáticamente `flutter format .` y abordará las advertencias de lint).
    *   Cuando se detecten errores de análisis, la IA primero intentará resolverlos ejecutando `flutter fix --apply .`.
    *   Problemas comunes específicos de Flutter como llamar a `setState` en un widget desmontado, eliminación inadecuada de recursos en los métodos `dispose()` o estructuras de árbol de widgets incorrectas.
    *   Asegurar un manejo adecuado de errores asíncronos (por ejemplo, agregando bloques `try-catch` para operaciones `Future`, usando comprobaciones `mounted` antes de `setState`).
*   **Informe de Problemas:** Si un error no se puede resolver automáticamente (por ejemplo, un error de lógica que requiere aclaración del usuario o un problema de entorno), la IA informará claramente el mensaje de error específico, su ubicación y una explicación concisa con una intervención manual sugerida o un enfoque alternativo para el usuario.

## **Especificidades de Material Design**

### **Temas (Theming)**

La IA implementará y gestionará un tema completo y coherente para la aplicación, adhiriéndose a los principios de Material Design 3. Esto incluye la definición de esquemas de color, tipografía y estilos de componentes en un objeto `ThemeData` centralizado.

#### **Esquemas de Color (Material 3)**

La IA priorizará el uso de `ColorScheme.fromSeed` para generar paletas de colores armoniosas y accesibles a partir de un único color semilla. Esta es la base de los temas de Material 3 y es compatible con el color dinámico en plataformas como Android.

#### **Tipografía y Fuentes Personalizadas**

La IA usará `TextTheme` para definir estilos de texto consistentes (por ejemplo, `displayLarge`, `titleMedium`, `bodySmall`). Para fuentes personalizadas, el paquete `google_fonts` es el enfoque recomendado por su facilidad de uso y su vasta biblioteca de fuentes.

Para usar `google_fonts`, agrégalo a tu proyecto:

```shell
flutter pub add google_fonts
```

*Ejemplo de `TextTheme` con `google_fonts`:*

```dart
import 'package:google_fonts/google_fonts.dart';

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.oswald(fontSize: 57, fontWeight: FontWeight.bold),
  titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500),
  bodyMedium: GoogleFonts.openSans(fontSize: 14),
);
```

#### **Temas de Componentes**

Para garantizar la coherencia de la interfaz de usuario, la IA utilizará propiedades de tema específicas (por ejemplo, `appBarTheme`, `elevatedButtonTheme`) para personalizar la apariencia de los componentes individuales de Material.

#### **Modo Oscuro/Claro y Conmutador de Tema**

La IA implementará soporte para temas claros y oscuros. Una solución de gestión de estado como `provider` es ideal para crear un conmutador de tema visible para el usuario (`ThemeMode.light`, `ThemeMode.dark`, `ThemeMode.system`).

#### **Ejemplo Completo de Temas**

El siguiente ejemplo demuestra una configuración de tema completa usando `provider` para un conmutador de tema y `google_fonts` para la tipografía.

Para usar `provider`, agrégalo a tu proyecto:

```shell
flutter pub add provider
```

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Importa GoogleFonts
import 'package:provider/provider.dart'; // Importa Provider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

// Clase ThemeProvider para gestionar el estado del tema
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Por defecto, tema del sistema

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primarySeedColor = Colors.deepPurple;

    // Define un TextTheme común
    final TextTheme appTextTheme = TextTheme(
      displayLarge: GoogleFonts.oswald(fontSize: 57, fontWeight: FontWeight.bold),
      titleLarge: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w500),
      bodyMedium: GoogleFonts.openSans(fontSize: 14),
    );

    // Tema Claro
    final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primarySeedColor,
        brightness: Brightness.light,
      ),
      textTheme: appTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: primarySeedColor,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primarySeedColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );

    // Tema Oscuro
    final ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primarySeedColor,
        brightness: Brightness.dark,
      ),
      textTheme: appTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: primarySeedColor.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Material AI App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material AI Demo'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.auto_mode),
            onPressed: () => themeProvider.setSystemTheme(),
            tooltip: 'Set System Theme',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome!', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
