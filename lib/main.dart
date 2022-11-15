import 'package:Slang/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(slang());
}

class slang extends StatelessWidget {
  const slang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: MyHomePage(),
    );
  }
}


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
