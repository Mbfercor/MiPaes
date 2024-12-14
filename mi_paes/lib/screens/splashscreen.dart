import 'package:flutter/material.dart';
import 'package:mi_paes/main.dart'; // Importa MainApp

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0; // Opacidad inicial

  @override
  void initState() {
    super.initState();
    // Inicia la animación
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0; // Cambia la opacidad a 0
      });

      // Navega a HomeScreen después de la espera y la animación
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.secondary, //Color de fondo secundario
      body: Center(
        child: AnimatedOpacity(
          duration:
              const Duration(milliseconds: 500), // Duración de la animación
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/logo.png', //Ruta de la imagen, recuerda la extensión
                width: 150, //Ajusta el tamaño de la imagen
                height: 150,
              ),
              const SizedBox(height: 20), //Espacio entre el icono y el texto
              const Text(
                'MiPaes.cl',
                style: TextStyle(
                  fontFamily:
                      'BricolageGrotesque-SemiBold', //Nombre de la fuente personalizada
                  fontSize: 40, //Tamaño de la fuente
                  color: Colors.black, //Color del texto
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
