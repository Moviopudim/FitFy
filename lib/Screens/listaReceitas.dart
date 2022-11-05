import 'package:Slang/Funcoes/criaReceita.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

import '../Funcoes/Receitas/Hamburguer.dart';
import '../Funcoes/Receitas/mingau.dart';
import '../Funcoes/Receitas/pizza.dart';

class ListaReceita extends StatefulWidget {
  const ListaReceita({super.key});

  @override
  State<ListaReceita> createState() => _ListaReceitaState();
}

class _ListaReceitaState extends State<ListaReceita> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Receitas"),
        centerTitle: true,
      ),
      body: ListView(
         children: <Widget>[
           criaSuplemento.CriaReceita('https://img.icons8.com/ios/344/porridge--v1.png', 'Mingau Proteico', 'Mingau Proteico Feito De Forma Simples e sem enrolação', Mingau()),
           criaSuplemento.CriaReceita('https://img.icons8.com/pastel-glyph/344/pizza--v2.png', 'Pizza Integral De Frango', 'Pizza De Frango Feita Com Pão Integral', Pizza()),
           criaSuplemento.CriaReceita('https://img.icons8.com/external-line-zulfa-mahendra/512/external-burguer-food-delivery-line-zulfa-mahendra-2.png', 'Hamburguer De Grão de Bico', 'Hamburguer Saboroso feito com grão de bico', Hamburguer(),)
         ],
      ),
    );
  }
}