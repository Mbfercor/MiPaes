import 'package:flutter/material.dart';

class MatematicasScreen extends StatelessWidget {
  const MatematicasScreen({super.key});

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
            Text('Matemáticas', style: TextStyle(color: Colors.white)),
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
              // Puntajes y Ponderaciones
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Puntajes y ponderaciones',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildProgressRow('Mejor puntaje', 0.9, Colors.orange),
                    _buildProgressRow('Promedio', 0.7, Colors.green),
                    _buildProgressRow('Último puntaje', 0.6, Colors.blue),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Opciones
              Text('MATEMÁTICAS 1',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildOptionCard('APUNTES', Colors.blue),
                  _buildOptionCard('CLASES', Colors.green),
                  _buildOptionCard('CHECK LIST', Colors.orange),
                  _buildOptionCard('QUIZ', Colors.purple),
                ],
              ),
              SizedBox(height: 20),
              // Ensayos
              Text('ENSAYOS',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('REALIZA UN ENSAYO'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('ENSAYOS PASADOS'),
              ),
              SizedBox(height: 20),
              // Ayuda
              Text('AYUDA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('SALUD MENTAL'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text('PROFESOR'),
                    ),
                  ),
                ],
              ),
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

  Widget _buildOptionCard(String title, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
