import 'package:flutter/material.dart';
import 'package:sang/main.dart';
import '../Screens/Lista de suplementos.dart';
import '../Funcoes/contador passos.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),

      body: Center(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            botaoHome('Suplementos', listaSuplementos(), Size.fromHeight(36)),
            botaoHome('Suplementos', listaCapsulas(), Size.fromHeight(36)),
            botaoHome('Capsulas', contadorPassos(), Size.fromHeight(36)),
          ],
        ),
      ),
    );
  }
}