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


class Herramientas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MiApp.fondo,
      appBar: AppBar(
        title: Text("Herramientas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                "Herramientas",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                //Falta Funcion
              },
              child: Text('Notas',style: TextStyle(fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
              ),
            ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calculadora');
                },
                child: Text('Calculadora',style: TextStyle(fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  minimumSize: MaterialStateProperty.all<Size>(Size(200, 60)),
                  
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        _calculateResult();
      } else if (buttonText == 'C') {
        _clearOutput();
      } else {
        _appendToOutput(buttonText);
      }
    });
  }

  void _appendToOutput(String text) {
    _output += text;
  }

  void _clearOutput() {
    _output = '';
  }

  void _calculateResult() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_output);
      ContextModel contextModel = ContextModel();
      double result = expression.evaluate(EvaluationType.REAL, contextModel);
      _output = result.toString();
    } catch (e) {
      _output = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MiApp.fondo,
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                children: [
                  _buildRow([
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/')
                  ]),
                  _buildRow([
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('*')
                  ]),
                  _buildRow([
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-')
                  ]),
                  _buildRow([
                    _buildButton('C'),
                    _buildButton('0'),
                    _buildButton('='),
                    _buildButton('+')
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 32.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey[800],
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
              color: Colors.white,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons,
      ),
    );
  }
}