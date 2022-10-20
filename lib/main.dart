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
              const telaSuplemento(
                titulo: 'Whey Protein',
                rotulo: 'Whey Protein',
                subtitulo:
                    'O Whey não é nada mais do que uma fonte de proteina versatil e 100% segura. Porém ele não deve ser a sua principal fonte de proteinas, que deve vir de alimentos como frango e carne. Para tomar o suplemento em pó basta misturar com agua, leite ou até mesmo em um shake. ',
                imagem:
                    'https://integralmedica.vteximg.com.br/arquivos/ids/155461-0-0/HIPERCALORICO-PROTEINA-NUTRIWHEY-BAUNILHA-POTE-907G-INTEGRALMEDICA.png?v=637002034035000000',
              )),
          criaSuplemento.CriaSuplemento(
              'https://www.madrugaosuplementos.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/r/creatina-integralmedica-300g.png',
              'Creatina',
              '"Aquele que os marombas tomam mas ninguem sabe o que faz"',
              const telaSuplemento(
                titulo: 'Creatina',
                rotulo: 'Creatina',
                subtitulo:
                    'A creatina, em resumo, aumenta a quantidade de agua dentro do seu musculo, fazendo seus musculos paracerem mais "cheios", para tomar basta misturar a quantidade ideal para o seu peso em um copo d´agua.',
                imagem:
                    'https://www.madrugaosuplementos.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/r/creatina-integralmedica-300g.png',
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
