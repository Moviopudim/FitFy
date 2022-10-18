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
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Example'),
        ),
        body: Container(
          height: double.infinity,
          // set the width of this Container to 100% screen width
          width: double.infinity,

          child: Column(
            // Vertically center the widget inside the column
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 152,
                child: botaoLinguagem(
                  texto: 'Linguagens',
                  rota: listaLinguagens(),
                ),
              ),
            ],
          ),
        ));
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
          criaLinguagem(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1200px-Unofficial_JavaScript_logo_2.svg.png',
              'JavaScript',
              'Tudo o que puder ser feito em Javascript, Será feito em JavaScript',
               telaLinguagem(titulo: 'JavaScript',)),
          criaLinguagem(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/C_Programming_Language.svg/1200px-C_Programming_Language.svg.png',
              'A linguagem C',
              'A mãe das linguagens modernas, provavelmente mais velha que você',
               telaLinguagem(titulo: 'A linguagem C',)),
          criaLinguagem(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/800px-Python-logo-notext.svg.png',
              'Python',
              'A lingugaem mais popular ultimamente, utilizada nas principais areas',
               telaLinguagem(titulo: 'Python',)),
        ]));
  }
}

class criaLinguagem extends StatelessWidget {
  final String imagem;
  final String rotulo;
  final String subtitulo;
  final Widget rota;

  criaLinguagem(this.imagem, this.rotulo, this.subtitulo, this.rota);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(imagem),
        title: Text(
          rotulo,
          style: TextStyle(fontSize: 32, fontFamily: 'Roboto'),
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

class telaLinguagem extends StatelessWidget {
  const telaLinguagem({Key? key, required this.titulo}) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Card(
        child: ListTile(
          leading: Image.network('https://raw.githubusercontent.com/Moviopudim/Slang/master/lib/images/pythonInstall.png'),
        ),
      ),
    );
  }
}

class botaoLinguagem extends StatelessWidget {
  botaoLinguagem({Key? key, required this.texto, required this.rota})
      : super(key: key);

  final String texto;
  final Widget rota;

  final ButtonStyle estiloBotao = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 23),
      backgroundColor: Colors.black26);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return rota;
        }));
      },
      style: estiloBotao,
      child: Text(texto),
    );
  }
}