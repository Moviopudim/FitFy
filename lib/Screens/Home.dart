import 'package:Slang/Screens/listaReceitas.dart';
import 'package:flutter/material.dart';
import 'package:Slang/main.dart';
import '../Screens/Lista de suplementos.dart';
import '../Funcoes/contador passos.dart';
import '../Funcoes/CheckUp.dart';
import 'Tracker.dart';
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
        backgroundColor: Colors.indigo,
      ),

      body: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(23),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        children: <Widget>[
          cardHome('Passos', contadorPassos(), 'A Função Que Contará Os Seus Passos Com Uma precisão inimaginavel'),
          cardHome('CheckUp', formulario(), 'Se Descubra, Responda 3 Campos E Saiba Mais Sobre Você'),
          cardHome('Água', formulario(), '"BEBA AGUA" que frase brega. Conte quantos litros de agua você tomou por dia'),
          cardHome('Tracker', tracker(), 'Acompanhe O Progresso Do Seu Peso!'),
          cardHome('Receitas', ListaReceita(), 'Faça Receitas Simples E Saudaveis Em Até 5 Passos'),
          cardHome('Suplementos', listaSuplementos(), 'Se Informe Sobre Suplementação A Qualquer Hora E Em Qualquer Lugar'),
          cardHome('Capsulas', listaCapsulas(), 'Os Principais Suplementos Em forma De Capsula'),
        ],
      )
    );
  }
}