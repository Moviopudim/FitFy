import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../Screens/Informacoes.dart';
import 'perguntaFormulario.dart';

class formulario extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);

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
              final int? peso = int.tryParse(_controladorPeso.text);
              final int? altura = int.tryParse(_controladorAltura.text);
              final int? idade = int.tryParse(_controladorIdade.text);

              final double agua = peso! * 35;
              final num imc = num.parse((peso / ((altura! / 100) * (altura / 100))).toStringAsPrecision(3));
              final double creatina = peso * 0.06;
              final double proteina = peso * 2;
              final double passada = altura * 0.415;
              final num pesoMinimo = num.parse((((altura / 100) * (altura / 100)) * 18.5).toStringAsPrecision(4));
              final num pesoMaximo = num.parse((((altura / 100) * (altura / 100)) * 24.9).toStringAsPrecision(4));

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return resultados(
                  resultadoAgua: agua.toString(),
                  resultadoImc: imc.toString(),
                  resultadoCreatina: creatina.toString(),
                  resultadoProteina: proteina.toString(),
                  resultadoPassada: passada.toString(),
                  resultadoPiMinimo: pesoMinimo.toString(),
                  resultadoPiMaximo: pesoMaximo.toString(),
                );
              }));

              debugPrint("peso: $peso Altura: $altura Idade: $idade");
            },
            style: style,
            child: const Text(
              'Ver Os Resultados',
            ),
          ),
        ],
      ),
    );
  }
}
