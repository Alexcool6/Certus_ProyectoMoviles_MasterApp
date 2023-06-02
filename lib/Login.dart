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

void iniciarAplicacion() {
  runApp(MiApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Inicio de Sesión',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Aquí puedes implementar la lógica de autenticación
    // como enviar los datos al servidor, verificar credenciales, etc.

    // Ejemplo básico de verificación de credenciales
    if (username == 'pupilo' && password == '123') {
      // Credenciales válidas, navegar a la siguiente pantalla
      Navigator.pushReplacementNamed(context, '/pupilo');
    } else {
      // Credenciales inválidas, mostrar mensaje de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Error',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Text(
            'Credenciales inválidas. Inténtalo de nuevo.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Aceptar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: 'Usuario',
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        TextField(
          controller: _passwordController,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelText: 'Contraseña',labelStyle: TextStyle(color: Colors.white,),
          ),
          obscureText: true,
        ),
        SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: _login,
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(color: Colors.black,),
          ),
        ),
      ],
    );
  }
}