// main.dart
import 'package:flutter/material.dart';
import 'package:mi_paes/screens/splashscreen.dart'; // Importa el archivo splashscreen.dart

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system, // Cambia según la configuración del sistema
      home: const SplashScreen(), // La primera pantalla será el SplashScreen
    );
  }
}

// Aquí tienes la pantalla que será el home después del splash
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold (
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Centra la columna verticalmente
          children: [
            Text('Soy el Home de la app'),
            Text('Soy el Home de la app'),
            Text('Soy el Home de la app'),
            Text('Soy el Home de la app'),
            Text('Soy el Home de la app'),
          ],
        ),
      ),
    ); // 
  }
}