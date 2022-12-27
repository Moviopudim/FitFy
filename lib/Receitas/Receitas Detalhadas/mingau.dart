import 'package:flutter/material.dart';


import '../../Constanst/colors.dart';

class Mingau extends StatefulWidget {
  const Mingau({super.key});

  @override
  State<Mingau> createState() => _MingauState();
}

class _MingauState extends State<Mingau> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mingau Proteico"),
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
  150 ml de água
  20g de whey protein
  1 colher (sopa) de cacau em pó
  3 colheres (sopa) de farelo de aveia
  1/2 banana amassada''')),
            ),
            const Step(
              title: Text('Passo 2'),
              content: Text('Em uma vasilha, acrescente o farelo de aveia e 50 ml de água filtrada. Cubra com um pano e deixe descansar por 10 minutos.'),
            ),
            Step(
              title: const Text('Passo 3'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Depois que a aveia estiver hidratada, transfira para um panela e adicione o restante da água. Leve ao fogo baixo e comece a mexer bem.')),
            ),
            Step(
              title: const Text('Passo 4'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Acrescente uma dose de whey protein e misture bem até dissolver. Adicione o cacau em pó e misture novamente.')),
            ),
            Step(
              title: const Text('Passo 5'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Por fim, acrescente a banana amassada e misture bem. Agora basta servir')),
            ),
          ],
        ),],
      ),
    );
  }
}