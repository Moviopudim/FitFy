import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../Screens/Informacoes.dart';
import 'perguntaFormulario.dart';

class formulario extends StatelessWidget {
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);

  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();
  final TextEditingController _controladorIdade = TextEditingController();

  formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Formulario"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          pergunta(
            controlador: _controladorPeso,
            rotulo: 'Peso (Kg)',
            dica: 'Digite o seu peso',
          ),
          pergunta(
            controlador: _controladorAltura,
            rotulo: 'Altura (CM)',
            dica: 'Digite a sua altura em centimetros',
          ),
          pergunta(
            controlador: _controladorIdade,
            rotulo: 'Idade',
            dica: 'Digite a sua idade',
          ),
          ElevatedButton(
            onPressed: () {
              debugPrint("Confirmou");

               Navigator.push(context, MaterialPageRoute(builder: (context) {
                return resultados();
              }));
            },
            style: style,
            child: const Text('Ver Os Resultados',),
          ),
        ],
      ),
    );
  }
}
