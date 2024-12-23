import 'package:flutter/material.dart';
import 'matematicas_screen.dart';

class MateriasScreen extends StatelessWidget {
  final String materiaName;

  // Constructor que recibe el nombre de la materia
  const MateriasScreen({super.key, required this.materiaName});

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
            Text(materiaName, style: TextStyle(color: Colors.white)), // Mostrar el nombre de la materia
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
              _buildSection('MATEMÁTICAS', [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MatematicasScreen()),
                    );
                  },
                  child: _buildSubjectTile('Matemáticas 1', Colors.orange),
                ),
                _buildSubjectTile('Matemáticas 2', Colors.orange),
              ]),
              SizedBox(height: 20),
              _buildSection('CIENCIAS', [
                _buildSubjectTile('Física', Colors.green),
                _buildSubjectTile('Química', Colors.green),
                _buildSubjectTile('Biología', Colors.green),
              ]),
              SizedBox(height: 20),
              _buildSection('LENGUAJE', [
                _buildSubjectTile('Competencia lectoras', Colors.blue),
              ]),
              SizedBox(height: 20),
              _buildSection('HISTORIA', [
                _buildSubjectTile('Historia y ciencias sociales', Colors.purple),
              ]),
            ],
          ),
        ),
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

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: children,
        ),
      ],
    );
  }

  Widget _buildSubjectTile(String title, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.school, color: color),
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
