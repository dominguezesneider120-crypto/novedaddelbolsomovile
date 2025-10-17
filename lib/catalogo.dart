import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String id;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.id,
    required this.imageUrl,
  });
}

class CatalogoScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'FRANKLIN BAG',
      price: '\$45.000',
      id: 'N° - 0472956',
      imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760142571/Bolso_amalia_1_rdjt90.webp',
    ),
    Product(
      name: 'JAV BAG - CHOC',
      price: '\$50.000',
      id: 'N° - 0472956',
      imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143272/bolso_amalia_2_qu6ewx.webp',
    ),
    Product(
      name: 'JACARANDA BAG - CHOC',
      price: '\$60.000',
      id: 'N° - 0472956',
      imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143359/Amalia_bolso_3_vrkm6u.jpg',
    ),
    Product(
      name: 'BRASIL BAG - CHOC',
      price: '\$55.000',
      id: 'N° - 0472956',
      imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143413/Amalia_bolso_4_zqxkzj.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xFF5D4037),
        title: Text('INVENTARIO', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.price,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(height: 2),
                      Text(
                        product.id,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
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
