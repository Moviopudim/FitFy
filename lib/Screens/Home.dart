import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sang/main.dart';
import '../Screens/Lista de suplementos.dart';
import '../Funcoes/contador passos.dart';
import 'listaCapsulas.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text('Home', style: TextStyle(fontSize: 28),),
        buttonStyle: NeumorphicStyle(depth: 3),
      ),

      body: Center(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            botaoHome('Suplementos', listaSuplementos(), Size.fromHeight(36)),
            botaoHome('Capsulas', listaCapsulas(), Size.fromHeight(36)),
            botaoHome('Passos', contadorPassos(), Size.fromHeight(36)),
          ],
        ),
      ),
    );
  }
}