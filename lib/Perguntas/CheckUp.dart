import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constanst/colors.dart';
import '../Home/Home.dart';
import '../Perguntas/resultados.dart';

class formulario extends StatefulWidget {
  formulario({Key? key}) : super(key: key);

  @override
  State<formulario> createState() => _formularioState();
}

class _formularioState extends State<formulario> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.white);

  final TextEditingController _controladorPeso = TextEditingController();

  final TextEditingController _controladorAltura = TextEditingController();

  final TextEditingController _controladorIdade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25))),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'CheckUp',
                    style: TextStyle(color: Colors.black87, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Responda 3 Perguntas e Tenha Todas as Respostas que Você Precisa',
                    style: TextStyle(color: Colors.black45, fontSize: 22),
                  ),
                ],
              ),
            ),
            buildTextField('Digite o Seu Peso', 'Peso(Kg)', true, _controladorPeso),
            buildTextField('Digite a Sua Altura', '170(Cm)', true, _controladorAltura),
            buildTextField('Digite a Sua Idade', '20', true, _controladorIdade),
            SizedBox(height: 32,),
            ElevatedButton(
              onPressed: () {
                final int? peso = int.tryParse(_controladorPeso.text);
                final int? altura = int.tryParse(_controladorAltura.text);
                final int? idade = int.tryParse(_controladorIdade.text);

                final double agua = peso! * 35;
                final num imc = num.parse(
                    (peso / ((altura! / 100) * (altura / 100)))
                        .toStringAsPrecision(3));
                final double creatina = peso * 0.06;
                final double proteina = peso * 2;
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
                    resultadoPi: Pi.toStringAsPrecision(3),
                  );
                }));

                debugPrint("peso: $peso Altura: $altura Idade: $idade");
              },
              style: style,
              child: const Text(
                'Ver Os Resultados',
                style: TextStyle(
                  color: Colors.green
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(
    String labelText, String placeholder, bool IsNumber, TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.only(left: 16, top: 25, right: 16),
    child: TextField(
      controller: controller,
      keyboardType: IsNumber != true ? TextInputType.text : TextInputType.number,
      style: TextStyle(color: Colors.black),
      maxLines: 1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          )),
    ),
  );
}
