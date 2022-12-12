import 'package:flutter/material.dart';

class criaSuplemento extends StatelessWidget {
  final String imagem;
  final String rotulo;
  final String subtitulo;
  final Widget rota;

  criaSuplemento.CriaReceita(
      this.imagem, this.rotulo, this.subtitulo, this.rota,
      {super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin;
    return  Card(
      child: ListTile(
        title: Text(
          rotulo,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(
          subtitulo,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return rota;
          }));
        },
      ),
    );
  }
}