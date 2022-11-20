import 'package:flutter/material.dart';

class cardHome extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  final Widget rota;

  cardHome(this.titulo, this.rota, this.subtitulo);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      child: ListTile(
        title: Text(
          titulo,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        subtitle: Text(
          subtitulo,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, color: Colors.black54),
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