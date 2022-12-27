import 'package:flutter/material.dart';


import '../../Constanst/colors.dart';

class Hamburguer extends StatefulWidget {
  const Hamburguer({super.key});

  @override
  State<Hamburguer> createState() => _HamburguerState();
}

class _HamburguerState extends State<Hamburguer> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hamburguer De Grão De Bico"),
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
1 xícara de grão de bico cozido
1/2 xícara de arroz integral cozido
2 colheres (sopa) de farinha panko 
3 colheres (sopa) de cenoura ralada
5 colheres (sopa) de cheiro verde picado
1 colher (sopa) de coentro picado
1 colher (sopa) de raspas de limão
Sal e pimenta-do-reino a gosto 
1 clara de ovo''')),
            ),
            const Step(
              title: Text('Passo 2'),
              content: Text('Bata o grão de bico no processador por 20 segundos, Adicione arroz integral e processe por mais 10 segundos'),
            ),
            Step(
              title: const Text('Passo 3'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Leve-os a um tigela e adicione a farinha panko, cenoura, cheiro verde, coentro, raspas de limão, sal e pimenta e misture muito bem.')),
            ),
            Step(
              title: const Text('Passo 4'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Acrescente a clara de ovo. Misture mais e leve à geladeira por 10 minutos para firmar. Depois, divida a massa e modele os hambúrgueres com a mão. ')),
            ),
            Step(
              title: const Text('Passo 5'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Leve a uma frigideira e grelhe por 5 a 8 minutos de cada lado. Também pode ser feito na airfryer.')),
            ),
          ],
        ),],
      ),
    );
  }
}