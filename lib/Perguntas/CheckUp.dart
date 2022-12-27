import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Constanst/colors.dart';
import '../Perguntas/resultados.dart';
import '../Funcoes/perguntaFormulario.dart';

class formulario extends StatefulWidget {
  formulario({Key? key}) : super(key: key);

  @override
  State<formulario> createState() => _formularioState();
}

void CollectInfo(peso, altura, idade){
  var box = Hive.box<String>('UserDataBox');

  box.put('peso', peso);
  box.put('altura', altura);
  box.put('idade', idade);

  debugPrint('foi');
}

class _formularioState extends State<formulario> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Kred);

  final TextEditingController _controladorPeso = TextEditingController();

  final TextEditingController _controladorAltura = TextEditingController();

  final TextEditingController _controladorIdade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
        centerTitle: true,
        backgroundColor: Kred,
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

              CollectInfo(peso?.toStringAsPrecision(3), altura?.toStringAsPrecision(3), idade?.toStringAsPrecision(2));

              final double agua = peso! * 35;
              final num imc = num.parse(
                  (peso / ((altura! / 100) * (altura / 100)))
                      .toStringAsPrecision(3));
              final double creatina = peso * 0.06;
              final double proteina = peso * 2;
              final double passada = altura * 0.415;
              final num pesoMinimo = num.parse(
                  (((altura / 100) * (altura / 100)) * 18.5)
                      .toStringAsPrecision(4));
              final num pesoMaximo = num.parse(
                  (((altura / 100) * (altura / 100)) * 24.9)
                      .toStringAsPrecision(4));
              final double Pi = (pesoMaximo + pesoMinimo) / 2;

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return resultados(
                  resultadoAgua: agua.toStringAsPrecision(4),
                  resultadoImc: imc.toStringAsPrecision(3),
                  resultadoCreatina: creatina.toStringAsPrecision(3),
                  resultadoProteina: proteina.toStringAsPrecision(3),
                  resultadoPassada: passada.toStringAsPrecision(3),
                  resultadoPi: Pi.toStringAsPrecision(3),
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
