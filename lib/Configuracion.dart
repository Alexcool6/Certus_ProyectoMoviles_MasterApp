//Librerias
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';
// Rutas (Todas por siacaso)
import 'Configuracion.dart';
import 'Herramientas.dart';
import 'Login.dart';
import 'main.dart';
import 'Menu_Maestro.dart';
import 'Menu_Pupilo.dart';

class Configuracion extends StatefulWidget {
  @override
  _ConfiguracionState createState() => _ConfiguracionState();
}

class _ConfiguracionState extends State<Configuracion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MiApp.fondo,
      appBar: AppBar(
        title: Text("Configuración"),
        leading: IconButton(
          icon: Icon(Icons.house),
          onPressed: () {
            setState(() {});
            Navigator.pushNamed(context, '/pupilo');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Modo Oscuro?",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    MiApp.fondo = Colors.blue;
                    setState(() {});
                  },
                  child: Icon(Icons.wb_sunny),
                ),
                FloatingActionButton(
                  onPressed: () {
                    MiApp.fondo = Colors.black;
                    setState(() {});
                  },
                  child: Icon(Icons.nights_stay),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
