import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generador de números aleatorios de lotería',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaNumeroAleatorio(),
    );
  }
}

class PaginaNumeroAleatorio extends StatefulWidget {
  @override
  _EstadoPaginaNumeroAleatorio createState() => _EstadoPaginaNumeroAleatorio();
}

class _EstadoPaginaNumeroAleatorio extends State<PaginaNumeroAleatorio> {
  int numeroAleatorio = 0;
  String loteria = '';

  void generarNumeroAleatorio() {
    setState(() {
      numeroAleatorio = Random().nextInt(1000);
      var loterias = ['Medellín', 'Risaralda', 'Santander'];
      loteria = loterias[Random().nextInt(loterias.length)];
    });
  }

  String formatoNumero(int numero) {
    if (numero < 10) {
      return "00$numero";
    } else if (numero < 100) {
      return "0$numero";
    } else {
      return numero.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de números aleatorios de lotería'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lotería: $loteria',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Número Aleatorio:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              '${formatoNumero(numeroAleatorio)}',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: generarNumeroAleatorio,
        tooltip: 'Generar Número Aleatorio de Lotería',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
