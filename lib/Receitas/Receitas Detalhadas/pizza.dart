import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

import '../../Constanst/colors.dart';

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Pizza De Frango"),
        centerTitle: true,
        backgroundColor: Kcyan,
      ),
      body:
      ListView(
        children: <Widget> [Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <= 3) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('Ingredientes'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('''
  4 fatias de pão de integral
  50 gramas de queijo minas em fatias ou ralado
  200 gramas de peito de frango cozido e desfiado
  molho de tomate caseiro
  tomate em rodelas a gosto
  orégano e manjericão a gosto ''')),
            ),
            const Step(
              title: Text('Passo 2'),
              content: Text('Forre uma assadeira com as fatias de pão integral.'),
            ),
            Step(
              title: const Text('Passo 3'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Cubra com molho de tomate. Depois, adicione o frango desfiado.')),
            ),
            Step(
              title: const Text('Passo 4'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Adicione o queijo minas e as rodelas de tomate.')),
            ),
            Step(
              title: const Text('Passo 5'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Salpique o orégano e o manjericão e leve ao forno até que o queijo derreta.')),
            ),
          ],
        ),],
      ),
    );
  }
}