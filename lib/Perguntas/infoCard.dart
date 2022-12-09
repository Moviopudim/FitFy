import 'package:flutter/material.dart';

class infoCard extends StatelessWidget {
  final String rotulo;
  final String subtitulo;
  final String imagem;


  infoCard({Key? key, required this.rotulo, required this.subtitulo, required this.imagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading:  Image.network(imagem, width: 50),
        title: Text(
          rotulo,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(
          subtitulo,
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
        ),
      ),
    );
  }
}

