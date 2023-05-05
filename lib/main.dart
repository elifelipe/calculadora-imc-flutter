import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      home: IMCCalculator(),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  IMCCalculatorState createState() => IMCCalculatorState();
}

class IMCCalculatorState extends State<IMCCalculator> {
  double peso = 0;
  double altura = 0;

  void calcularIMC() {
    double imc = peso / (altura * altura);
    // Mostra o resultado do IMC em um diálogo.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seu IMC é ${imc.toStringAsFixed(2)}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                setState(() {
                  peso = double.parse(valor);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Altura (m)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                setState(() {
                  altura = double.parse(valor);
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Calcular'),
              onPressed: calcularIMC,
            ),
          ],
        ),
      ),
    );
  }
}
