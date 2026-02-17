import 'package:flutter/material.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Georgia', // Un toque elegante para boutique
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- ENCABEZADO (APPBAR) ---
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 199, 255),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black), // Icono de rayitas
          onPressed: () {
            // Aquí se abriría el menú lateral
          },
        ),
        title: const Text(
          "Boutique Moon Sweet",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black), // Icono de lupita
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- SECCIÓN SUPERIOR: IMAGEN CON TEXTO Y BOTÓN ---
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://raw.githubusercontent.com/vazquezmunozsofiaximena/Imagenes_Para_Flutter_6J_11-Febrero-2026/refs/heads/main/images.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(height: 200, color: Colors.black.withOpacity(0.25)),
                Column(
                  children: [
                    const Text(
                      "Las mejores compras\nde Invierno",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        shadows: [Shadow(blurRadius: 15, color: Colors.black45)],
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {},
                      child: const Text("¡COMPRAR!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),

            // --- SECCIÓN DE TEXTOS ---
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                children: const [
                  Text(
                    "Boutique Moon Sweet",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Las mejores prendas para las mejores ocasiones",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

            // --- SECCIÓN DE DIBUJOS/PRODUCTOS DESTACADOS ---
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Productos Destacados", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
            
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
              itemCount: 4, 
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: NetworkImage('https://cdn-icons-png.flaticon.com/512/3531/3531818.png'), // Icono de ropa
                            scale: 5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(" Prenda Chic", style: TextStyle(fontWeight: FontWeight.w600)),
                    const Text(" \$45.00", style: TextStyle(color: Colors.purpleAccent)),
                  ],
                );
              },
            ),
            const SizedBox(height: 50), // Espacio extra para que se note el corte al final
          ],
        ),
      ),

      // --- BARRA INFERIOR ---
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 30), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined, size: 30), label: "Carrito"),
        ],
      ),
    );
  }
}