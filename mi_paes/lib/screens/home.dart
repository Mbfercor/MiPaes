import 'package:flutter/material.dart';

class HomScreen extends StatefulWidget {
  const HomScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomScreen> {
  final List<Map<String, dynamic>> _subjects = [
    {'name': 'Competencia lectoras', 'color': Colors.blue},
    {'name': 'Ciencias - Biología', 'color': Colors.green},
    {'name': 'Física', 'color': Colors.orange},
    {'name': 'Historia y ciencias sociales', 'color': Colors.purple},
  ];

  void _addSubject(String subjectName) {
    setState(() {
      _subjects.add({'name': subjectName, 'color': Colors.grey});
    });
  }

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
            Text('Home', style: TextStyle(color: Colors.white)),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.white),
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
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Puntajes',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    _buildProgressRow('Historia', 0.8, Colors.purple),
                    _buildProgressRow('Ciencia - Biología', 0.6, Colors.green),
                    _buildProgressRow('Matemáticas M1', 0.9, Colors.orange),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Text('Ponderación',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.green,
                            child: Text('860',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Materias
              Text('MATERIAS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: _subjects.map((subject) {
                  return _buildSubjectCard(subject['name'], subject['color']);
                }).toList(),
              ),
              SizedBox(height: 20),
              // Otros
              Text('OTROS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('REALIZA UN ENSAYO'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('SALUD MENTAL'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String newSubject = '';
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Agregar Nueva Materia'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Nombre de la materia'),
                  onChanged: (value) {
                    newSubject = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (newSubject.isNotEmpty) {
                        _addSubject(newSubject);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('Agregar'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.language), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: ''),
        ],
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
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
