import 'package:Vitality/Receitas/criaReceita.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

import '../Constanst/colors.dart';
import 'Receitas Detalhadas/Hamburguer.dart';
import 'Receitas Detalhadas/mingau.dart';
import 'Receitas Detalhadas/pizza.dart';

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
        backgroundColor: Kcyan,
        centerTitle: true,
      ),
       body: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
          primary: true,
          children: <Widget>[
            criaSuplemento.CriaReceita('https://img.icons8.com/ios/344/porridge--v1.png', 'Mingau Proteico', 'Mingau Proteico Feito De Forma Simples e sem enrolação', Mingau()),
            criaSuplemento.CriaReceita('https://img.icons8.com/pastel-glyph/344/pizza--v2.png', 'Pizza Integral De Frango', 'Pizza De Frango Feita Com Pão Integral', Pizza()),
            criaSuplemento.CriaReceita('https://img.icons8.com/external-line-zulfa-mahendra/512/external-burguer-food-delivery-line-zulfa-mahendra-2.png', 'Hamburguer De Grão de Bico', 'Hamburguer Saboroso feito com grão de bico', Hamburguer(),)
          ],
        )
      );
  }
}

