<<<<<<< HEAD
# Blueprint de la Aplicación

## Visión General

Esta es una aplicación base de Flutter bien estructurada que sigue las mejores prácticas de desarrollo. Proporciona una base sólida para construir aplicaciones complejas, con una clara separación de responsabilidades, gestión de temas y un diseño visualmente atractivo.

## Diseño y Estilo

La aplicación utiliza Material Design 3 y se centra en un diseño moderno y personalizable:

*   **Theming:**
    *   Uso de `ColorScheme.fromSeed` para generar paletas de colores armoniosas a partir de un único color semilla (`Colors.deepPurple`).
    *   Soporte para modos de tema claro y oscuro, con un conmutador para que el usuario elija.
    *   Gestión de estado del tema centralizada mediante un `ThemeProvider` con el paquete `provider`.
*   **Tipografía:**
    *   El paquete `google_fonts` se utiliza para fuentes personalizadas, mejorando la legibilidad y la estética.
    *   **Títulos:** Oswald
    *   **Cuerpo del Texto:** Open Sans, Roboto
*   **Componentes:** Los widgets de Material, como `AppBar` y `ElevatedButton`, están estilizados de forma coherente en los temas claro y oscuro.

## Estructura del Proyecto

El código está organizado en varios archivos para mejorar la mantenibilidad:

*   `lib/main.dart`: El punto de entrada de la aplicación. Inicializa el `ThemeProvider` y ejecuta la aplicación.
*   `lib/my_app.dart`: Contiene el widget `MyApp`, que es la raíz de la aplicación. Configura el `MaterialApp`, define los temas claro y oscuro, y utiliza un `Consumer` para reaccionar a los cambios de tema.
*   `lib/my_home_page.dart`: Define el widget `MyHomePage`, que representa la pantalla principal de la aplicación. Incluye la `AppBar` con los conmutadores de tema y el contenido del cuerpo.

## Dependencias

*   `provider`: Para la gestión de estado, específicamente para manejar el estado del tema de la aplicación.
*   `google_fonts`: Para utilizar fuentes personalizadas de la biblioteca de Google Fonts.

## Plan Actual: Organizar main.dart

Se ha refactorizado la aplicación para separar las responsabilidades en diferentes archivos, mejorando la estructura y la legibilidad del proyecto. El `main.dart` original se ha dividido en `main.dart`, `my_app.dart` y `my_home_page.dart`.
=======
# Project Blueprint

## Overview

This project is a Flutter application that displays an inventory of bags. Users can view a list of bags and tap on any bag to see more details.

## Style, Design, and Features (v1)

*   **UI Design:** Modern and clean, based on the provided user interface image.
*   **Color Scheme:**
    *   AppBar: Dark Brown
    *   Background: Light Gray
    *   Price Text: Red-Orange
*   **Typography:** Custom fonts using `google_fonts` to match the visual style.
*   **Navigation:**
    *   An inventory screen displaying bags in a grid.
    *   A detail screen for each bag.
    *   Tapping on a bag in the inventory navigates to its detail screen.
*   **Architecture:**
    *   **Model-View-Widget:** Using a `Bag` model to represent data.
    *   **Separation of Concerns:** Widgets are separated into `screens` and `widgets` directories.

## Current Plan: Initial Implementation

1.  **Setup:** Add `google_fonts` dependency.
2.  **Models:** Create `lib/models/bag_model.dart` for the `Bag` data structure.
3.  **Create Inventory Screen:** Implement `lib/screens/inventory_screen.dart` to display a grid of bags.
4.  **Create Bag Item Widget:** Build `lib/widgets/bag_grid_item.dart` for the individual bag display in the grid.
5.  **Create Detail Screen:** Create a placeholder `lib/screens/detail_screen.dart`.
6.  **Update `main.dart`:** Set up the main app theme and initial route.
7.  **Asset Management:** Use a network image for the bags initially.
>>>>>>> 4b49f35 (inventarioapp)
