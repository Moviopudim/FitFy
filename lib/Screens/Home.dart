import 'package:Slang/Screens/listaReceitas.dart';
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

      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        children: <Widget>[
          cardHome('Passos', contadorPassos(), 'A Função Que Contará Os Seus Passos Com Uma precisão inimaginavel'),
          cardHome('CheckUp', formulario(), 'Se Descubra, Responda 3 Campos E Saiba Mais Sobre Você'),
          cardHome('Receitas', ListaReceita(), 'Faça Receitas Simples E Saudaveis Em Até 5 Passos'),
          cardHome('Suplementos', listaSuplementos(), 'Se Informe Sobre Suplementação A Qualquer Hora E Em Qualquer Lugar'),
          cardHome('Capsulas', listaCapsulas(), 'Os Principais Suplementos Em forma De Capsula'),
        ],
      )
    );
  }
}