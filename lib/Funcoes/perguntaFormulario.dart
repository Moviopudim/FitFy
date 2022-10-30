import 'package:flutter/material.dart';

class pergunta extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;

  const pergunta(
      {Key? key,
        required this.controlador,
        required this.rotulo,
        required this.dica})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: controlador,
              style: const TextStyle(fontSize: 19.0),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: rotulo,
                hintText: dica,
              )),

        )
      ],
    );
  }
}
