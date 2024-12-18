import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mi_paes/components/formulario_materias.dart';
import 'package:mi_paes/screens/materias_screen.dart';

class Mantenedor extends StatefulWidget {
  const Mantenedor({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MantenedorState createState() => _MantenedorState();
}

class _MantenedorState extends State<Mantenedor> {
  int _currentIndex = 0;

  //Cantidad de pantallas que se desean, un array con todas las pantallas

  final List<Widget> _screens = <Widget>[
    const PuntajesScreen(), //Pantalla de puntajes
    const RamosScreen(), //Pantalla de materias
    const InicioScreen(), //Pantalla del home
    const EnsayosScreen(), //Pantalla de ensayos
    const AyudaScreen(), //Pantalla de ayuda
  ];

  //Funcion para cambiar la pantalla cuando el usuario toca un icono, mas abajo esta setState()
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], //Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, //Índice actual de la barra de navegación
        onTap:
            _onItemTapped, //Llama a la funcion cuando se selecciona una pestaña
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: '',
          ),
        ],
      ),
    );
  }
}

//Pantalla para mostrar el contenido de puntajes
class PuntajesScreen extends StatelessWidget {
  const PuntajesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Puntajes'));
  }
}

//Pantalla para mostrar el contenido de materias
class RamosScreen extends StatelessWidget {
  const RamosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Materias'));
  }
}

//Pantalla para mostrar el contenido del home
class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.purple),
            ),
            const Text('Home', style: TextStyle(color: Colors.white)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Puntajes y Ponderación
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Puntajes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildProgressRow('Historia', 0.8, Colors.purple),
                    _buildProgressRow('Ciencia - Biología', 0.6, Colors.green),
                    _buildProgressRow('Matemáticas M1', 0.9, Colors.orange),
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Ponderación',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.green,
                            child: const Text(
                              '860',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Materias desde Firebase
              const Text(
                'MATERIAS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('materias')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                        child: Text('No hay registros disponibles.'));
                  }

                  final materias = snapshot.data!.docs;

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: materias.map((materia) {
                      final data = materia.data() as Map<String, dynamic>;
                      return _buildSubjectCard(
                          data['Nombre de la materia'] ?? '', Colors.grey);
                    }).toList(),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Otros
              const Text(
                'OTROS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('REALIZA UN ENSAYO'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('SALUD MENTAL'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => FractionallySizedBox(
              heightFactor: 0.9, // Ajusta la altura del modal
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child:
                          FormularioScreen(), // Mantengo el formulario_materias aquí
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop(); // Cierra el modal
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProgressRow(String title, double value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Expanded(
          child: Slider(
            value: value,
            onChanged: (v) {},
            activeColor: color,
            inactiveColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectCard(String title, Color color) {
    return GestureDetector(
      onTap: () {
        // Al hacer clic, navegamos a MateriasScreen pasando el nombre de la materia
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MateriasScreen(materiaName: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

//Pantalla para mostrar el contenido del ensayos
class EnsayosScreen extends StatelessWidget {
  const EnsayosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Ensayos'));
  }
}

//Pantalla para mostrar el contenido del ensayos
class AyudaScreen extends StatelessWidget {
  const AyudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Ayuda'));
  }
}
