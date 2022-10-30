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
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class botaoHome extends StatelessWidget {
  final String texto;

  final Widget rota;

  botaoHome(this.texto, this.rota, Size size);

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return rota;
        }));
      },
      text: texto,
      textStyle: const TextStyle(
        fontSize: 22
      ),
      size: GFSize.LARGE,
      color: Colors.black54,
      shape: GFButtonShape.pills,
    );
  }
}
