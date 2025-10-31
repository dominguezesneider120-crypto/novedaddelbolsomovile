
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 1. Modelo de datos para un producto
class Producto {
  final String nombre;
  final double precio;
  final String imageUrl;

  Producto({required this.nombre, required this.precio, required this.imageUrl});
}

// 2. Datos de ejemplo (reemplazar con datos de una base de datos en el futuro)
final List<Producto> inventario = [
  Producto(nombre: 'Bolso Clásico de Cuero', precio: 120.00, imageUrl: 'https://picsum.photos/seed/bolso1/400/500'),
  Producto(nombre: 'Bolso Tote Moderno', precio: 85.50, imageUrl: 'https://picsum.photos/seed/bolso2/400/500'),
  Producto(nombre: 'Mochila Urbana', precio: 95.00, imageUrl: 'https://picsum.photos/seed/bolso3/400/500'),
  Producto(nombre: 'Bolso de Noche Elegante', precio: 150.75, imageUrl: 'https://picsum.photos/seed/bolso4/400/500'),
  Producto(nombre: 'Bandolera Casual', precio: 60.00, imageUrl: 'https://picsum.photos/seed/bolso5/400/500'),
  Producto(nombre: 'Bolso de Viaje Espacioso', precio: 180.25, imageUrl: 'https://picsum.photos/seed/bolso6/400/500'),
  Producto(nombre: 'Cartera de Fiesta', precio: 75.00, imageUrl: 'https://picsum.photos/seed/bolso7/400/500'),
  Producto(nombre: 'Bolso Playero', precio: 45.50, imageUrl: 'https://picsum.photos/seed/bolso8/400/500'),
];

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D4037),
        title: const Text('INVENTARIO', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF381C09),
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Perfil'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.store_outlined),
              title: const Text('Cambio de tienda'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: const Text('Stock'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Salir'),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
      // 3. UI actualizada para usar la lista dinámica
      body: GridView.builder(
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.75, // Ajustado para mejor visualización
        ),
        itemCount: inventario.length, // Usa la longitud de la lista
        itemBuilder: (context, index) {
          final producto = inventario[index]; // Obtiene el producto actual
          return Card(
            elevation: 4,
            clipBehavior: Clip.antiAlias, // Para que la imagen respete los bordes redondeados
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    producto.imageUrl, // Carga la imagen desde la URL
                    fit: BoxFit.cover,
                    width: double.infinity,
                    // Muestra un indicador de carga mientras la imagen se descarga
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    // Muestra un ícono de error si la imagen no se puede cargar
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.error_outline, color: Colors.red));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    producto.nombre, // Muestra el nombre del producto
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0).copyWith(bottom: 10.0),
                  child: Text(
                    '\$${producto.precio.toStringAsFixed(2)}', // Muestra el precio formateado
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
