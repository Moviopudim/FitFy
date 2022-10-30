import 'package:flutter/material.dart';
import 'package:Slang/main.dart';
import '../Screens/Lista de suplementos.dart';
import '../Funcoes/contador passos.dart';
import '../Funcoes/CheckUp.dart';
import 'listaCapsulas.dart';
import 'package:getwidget/getwidget.dart';

class MyHomePage extends StatelessWidget {

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Home"),
        centerTitle: true,
      ),

      body: Center(
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            botaoHome('Suplementos', listaSuplementos(), Size.fromHeight(36)),
            botaoHome('Capsulas', listaCapsulas(), Size.fromHeight(36)),
            botaoHome('Passos', contadorPassos(), Size.fromHeight(36)),
            botaoHome('Suas Informações', formulario(), Size.fromHeight(36)),
          ],
        ),
      ),
    );
  }
}