
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
