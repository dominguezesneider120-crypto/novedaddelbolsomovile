import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/separe.dart';

class Tienda {
  late String name;
  late String ubicacion;
  Tienda({required this.name, required this.ubicacion});
}

class Product {
  String imageUrl;
  double price;
  String name;
  Tienda tienda;
  Product({required this.imageUrl, required this.price, required this.name, required this.tienda});
}

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  Tienda? _tiendaSeleccionada;
  final List<Product> _products = [
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143413/Amalia_bolso_4_zqxkzj.webp', price: 50000, name: 'Bolso 1', tienda: Tienda(name:'Tienda 1', ubicacion: 'Ubicacion 1')),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143359/Amalia_bolso_3_vrkm6u.jpg', price: 60.00, name: 'Bolso 2', tienda: Tienda(name:'Tienda 1', ubicacion: 'Ubicacion 1')),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760143272/bolso_amalia_2_qu6ewx.webp', price: 70.00, name: 'Bolso 3', tienda: Tienda(name:'Tienda 2', ubicacion: 'Ubicacion 2')),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760142571/Bolso_amalia_1_rdjt90.webp', price: 80.00, name: 'Bolso 4', tienda: Tienda(name:'Tienda 2', ubicacion: 'Ubicacion 2')),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760748319/bolso_amalia_5_fbsgve.webp', price: 90.00, name: 'Bolso 5', tienda: Tienda(name:'Tienda 3', ubicacion: 'Ubicacion 3')),
    Product(imageUrl: 'https://res.cloudinary.com/dt1rhz43z/image/upload/v1760748319/bolso_amalia_6_zv8gvg.webp', price: 100.00, name: 'Bolso 6', tienda: Tienda(name:'Tienda 3', ubicacion: 'Ubicacion 3')),
  ];

  final List<Tienda> _tiendas = [
    Tienda(name: 'Tienda 1', ubicacion: 'Ubicacion 1'),
    Tienda(name: 'Tienda 2', ubicacion: 'Ubicacion 2'),
    Tienda(name: 'Tienda 3', ubicacion: 'Ubicacion 3'),
  ];

  @override
  void initState() {
    super.initState();
    _tiendaSeleccionada = _tiendas.first; // Por defecto la primera tienda
  }



  void _mostrarDialogoAnadirTienda() {
    final formKey = GlobalKey<FormState>();
    String nombreTienda = '';
    String ubicacionTienda = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Añadir nueva tienda'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre de la tienda'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nombreTienda = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Ubicación'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una ubicación';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    ubicacionTienda = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Añadir'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  setState(() {
                    _tiendas.add(Tienda(name: nombreTienda, ubicacion: ubicacionTienda));
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final productosFiltrados = _products
        .where((p) => p.tienda.name == _tiendaSeleccionada?.name)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D4037),
        title: Text(
          _tiendaSeleccionada?.name ?? 'Inventario General',
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
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
            ..._tiendas.map((tienda) {
              return Dismissible(
                key: Key(tienda.name),
                direction: DismissDirection.startToEnd,
                confirmDismiss: (direction) async {
                  final bool? res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirmar"),
                        content: const Text("¿Estás seguro de que quieres eliminar esta tienda?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("NO"),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("SI"),
                          ),
                        ],
                      );
                    },
                  );
                  return res ?? false;
                },
                onDismissed: (direction) {
                  setState(() {
                    _tiendas.removeWhere((t) => t.name == tienda.name);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${tienda.name} eliminada")),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  leading: const Icon(Icons.store_outlined),
                  title: Text(tienda.name),
                  onTap: () {
                    setState(() {
                      _tiendaSeleccionada = tienda;
                    });
                    Navigator.pop(context); // cerrar drawer
                  },
                ),
              );
            }).toList(),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Añadir tienda'),
              onTap: () {
                Navigator.pop(context);
                _mostrarDialogoAnadirTienda();
                },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.content_paste),
              title: const Text('Separe'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SepareScreen()));
              },
            ),
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
        itemCount: productosFiltrados.length,
        itemBuilder: (context, index) {
          final product = productosFiltrados[index];
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
