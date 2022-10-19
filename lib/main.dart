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
          title: const Text('Home'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 170,
                child: botaoHome(
                  texto: 'Suplementos',
                  rota: listaSuplementos(),
                ),
              ),
            ],
          ),
        ));
  }
}

class listaSuplementos extends StatelessWidget {
  final ButtonStyle estiloBotao = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 23),
      backgroundColor: Colors.black26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Suplementos'),
          backgroundColor: Colors.black38,
        ),
        body: ListView(children: <Widget>[
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/162992-0-0/MicrosoftTeams-image.png?v=637744811631300000',
              'Whey Protein',
              'O Famosinho dos suplementos, aquele que todo mundo conhece',
              const telaSuplemento(titulo: 'Whey Protein', rotulo: 'Whey Protein', subtitulo: 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', imagem:'https://integralmedica.vteximg.com.br/arquivos/ids/155461-0-0/HIPERCALORICO-PROTEINA-NUTRIWHEY-BAUNILHA-POTE-907G-INTEGRALMEDICA.png?v=637002034035000000',
              ))
        ]));
  }
}

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
    return Card(
      child: ListTile(
        leading: Image.network(imagem, width: 100),
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
          leading: Image.network(imagem, width: 50, height: 150,),
          title: Text(
            rotulo,
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            subtitulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class botaoHome extends StatelessWidget {
  botaoHome({Key? key, required this.texto, required this.rota})
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
