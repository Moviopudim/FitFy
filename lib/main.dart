import 'package:flutter/material.dart';

void main() {
  runApp(slang());
}

class slang extends StatelessWidget {
  const slang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: listaLinguagens(),
      ),
    );
  }
}

class listaLinguagens extends StatelessWidget {

  final ButtonStyle estiloBotao = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 23),
      backgroundColor: Colors.black26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Linguagens'),
          backgroundColor: Colors.black38,
        ),

        body: ListView(children: <Widget>[
          Card(
            child: ListTile(
              leading: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1200px-Unofficial_JavaScript_logo_2.svg.png'),
              title: const Text('Javascript',
                style: TextStyle(fontSize: 32, fontFamily: 'Roboto'),),
              subtitle: const Text(
                'Tudo o que puder ser feito em JavaScript será feito em JavaScript',
                style: TextStyle(fontStyle: FontStyle.italic),),
            ),
          ),
          ElevatedButton(onPressed: () {},
            style: estiloBotao,
            child: const Text('Aprender'),),

          criaLinguagem(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/C_Programming_Language.svg/1200px-C_Programming_Language.svg.png',
              'A linguagem C',
              'A mãe das linguagens modernas, provavelmente mais velha que você')
        ]));
  }
}

class criaLinguagem extends StatelessWidget {

  final String imagem;
  final String rotulo;
  final String subtitulo;


  criaLinguagem(this.imagem, this.rotulo, this.subtitulo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imagem),
        title: Text(
          rotulo, style: TextStyle(fontSize: 32, fontFamily: 'Roboto'),),
        subtitle: Text(
          subtitulo, style: TextStyle(fontStyle: FontStyle.italic),),
      ),
    );
  }}
