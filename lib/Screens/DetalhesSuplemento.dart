import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';

class telaSuplemento extends StatelessWidget {
  const telaSuplemento({Key? key,
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
      appBar: GFAppBar(
        title: Text(titulo),
        centerTitle: true,
        backgroundColor: Colors.indigo,
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            subtitle:
            Text(
              subtitulo,
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
    );
  }
}