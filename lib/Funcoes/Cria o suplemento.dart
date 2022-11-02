import 'package:flutter/material.dart';

class criaSuplemento extends StatelessWidget {
  final String imagem;
  final String rotulo;
  final String subtitulo;
  final Widget rota;

  criaSuplemento.CriaSuplemento(
      this.imagem, this.rotulo, this.subtitulo, this.rota,
      {super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets margin;
    return  Card(
        child: ListTile(
          leading: Image.network(imagem, width: 100),
          title: Text(
            rotulo,
            style: TextStyle(fontSize: 32),
          ),
          subtitle: Text(
            subtitulo,
            style: TextStyle(fontStyle: FontStyle.italic),
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