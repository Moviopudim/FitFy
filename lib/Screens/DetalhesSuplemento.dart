import 'package:flutter/material.dart';

class telaSuplemento extends StatelessWidget {
  const telaSuplemento(
      {Key? key,
        required this.titulo,
        required this.rotulo,
        required this.subtitulo,
        required this.imagem})
      : super(key: key);

  final String titulo;
  final String rotulo;
  final String subtitulo;
  final String imagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Card(
        child: ListTile(
          leading: Image.network(
            imagem,
            width: 50,
            height: 150,
          ),
          title: Text(
            rotulo,
            style: TextStyle(fontSize: 32),
          ),
          subtitle: Text(
            subtitulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}