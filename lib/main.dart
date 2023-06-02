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

void main() {
  iniciarAplicacion();
}

class MiApp extends StatelessWidget {
  static Color fondo = Colors.black;

  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginApp(),
        '/configuracion': (context) => Configuracion(),
        '/calculadora': (context) => Calculadora(),
        '/herramientas':(context) => Herramientas(),
        '/pupilo':(context) => Pupilo()
      },
    );
  }
}