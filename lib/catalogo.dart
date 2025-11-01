
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Product {
  String imageUrl;
  double price;
  String name;

  Product({required this.imageUrl, required this.price, required this.name});
}

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Product> _products = [
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143413/Amalia_bolso_4_zqxkzj.webp', price: 50.00, name: 'Bolso 1'),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143359/Amalia_bolso_3_vrkm6u.jpg', price: 60.00, name: 'Bolso 2'),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143272/bolso_amalia_2_qu6ewx.webp', price: 70.00, name: 'Bolso 3'),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760142571/Bolso_amalia_1_rdjt90.webp', price: 80.00, name: 'Bolso 4'),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760748319/bolso_amalia_5_fbsgve.webp', price: 90.00, name: 'Bolso 5'),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760748319/bolso_amalia_6_zv8gvg.webp', price: 100.00, name: 'Bolso 6'),
  ];

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
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.75, // Adjusted for larger images
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 5,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child:
                              Icon(Icons.error, color: Colors.red, size: 50));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    product.name,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: TextFormField(
                    initialValue: product.price.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                    decoration: const InputDecoration(
                      labelText: 'Precio',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) {
                      setState(() {
                        product.price = double.tryParse(value) ?? 0.0;
                      });
                    },
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
