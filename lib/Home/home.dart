import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Bolsos',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Arial', // Puedes configurar una fuente personalizada
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // --- Lógica para el Slider Automático ---
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  // Lista de imágenes para el slider. Estas URLs vendrían de Firebase Storage.
  final List<String> _sliderImages = [
    'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760660013/bolsofondo_wwk2m9.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Inicia un temporizador para cambiar la imagen cada 3 segundos
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _sliderImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Detiene el temporizador para no gastar recursos
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- 1. Sección del Slider ---
              _buildHeroSlider(),
              
              // --- 2. Sección de Categorías ---
              _buildCategories(),
              
              const Divider(height: 1),

              // --- 3. Sección de Destacados ---
              _buildFeaturedProducts(),

              // --- 4. Sección de Promoción ---
              _buildPromotion(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para el slider con contenido superpuesto
  Widget _buildHeroSlider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // El carrusel de imágenes de fondo
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _sliderImages.length,
            itemBuilder: (context, index) {
              return Image.network(
                _sliderImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        
        // Contenido superpuesto (ícono y botón)
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, size: 80, color: Colors.black54),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 97, 65, 65).withOpacity(0.8),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () { /* Acción del botón */ },
              child: const Text('VER COLECCION', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  // Widget para las categorías
  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(onPressed: () {}, child: const Text('MOCHILAS', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))),
          TextButton(onPressed: () {}, child: const Text('CARTERAS', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))),
          TextButton(onPressed: () {}, child: const Text('MALETAS', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
  
  // Widget para los productos destacados
  Widget _buildFeaturedProducts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'DESTACADOS',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Estos serían cargados desde Firebase Firestore
              _productPlaceholder(),
              _productPlaceholder(),
              _productPlaceholder(),
            ],
          ),
        ],
      ),
    );
  }

  // Widget para el botón de promoción
  Widget _buildPromotion() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black87,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'PROMOCIÓN',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
  
  // Un placeholder para un producto
  Widget _productPlaceholder() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(Icons.image, size: 40, color: Colors.grey),
    );
  }
}