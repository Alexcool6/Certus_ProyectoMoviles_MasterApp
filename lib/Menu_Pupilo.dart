//Librerias
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

// Rutas (Todas por si acaso)
import 'Configuracion.dart';
import 'Herramientas.dart';
import 'Login.dart';
import 'main.dart';
import 'Menu_Maestro.dart';
import 'Menu_Pupilo.dart';

class Pupilo extends StatefulWidget {
  @override
  _PupiloState createState() => _PupiloState();
}

class _PupiloState extends State<Pupilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MiApp.fondo,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.house),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/configuracion');
              setState(() {});
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: MiApp.fondo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ 
              SizedBox(height: 20),
              Image.asset(
                    'assets/Logo.png',
                    width: 150, // Ajusta el ancho de la imagen aquí
                    height: 150, // Ajusta la altura de la imagen aquí
                  ),
                  SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 30),
                  Image.asset(
                    'assets/Bart.jpg',
                    width: 200, // Ajusta el ancho de la imagen aquí
                    height: 200, // Ajusta la altura de la imagen aquí
                  ),
                  SizedBox(width: 60), // Espacio entre la imagen y el texto
                  Text(
                    'Nombre del Estudiante',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text(
                "MENU",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                //Falta Funcion
                },
                child: Text('Ver Tareas Pendientes',style: TextStyle(fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/herramientas');
                  setState(() {});
                },
                child: Text('Herramientas',style: TextStyle(fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}