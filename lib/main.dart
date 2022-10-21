import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                  height: 170,
                  width: 170,
                  child: Scaffold(
                    body: botaoHome(
                      texto: 'Suplementos',
                      rota: listaSuplementos(),
                      texto2: 'Capsulas',
                      rota2: listaCapsulas(),
                    ),
                  )),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black12,
          child: const Icon(Icons.account_balance),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black38,
                ),
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_filled),
                title: Text('Home'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
              ),
               ListTile(
                leading: Icon(Icons.ad_units_sharp),
                title: Text('Capsulas'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return listaCapsulas();
                  }));
                }
              ),
            ],
          ),
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
              )),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/164352-0-0/Cena_Glutamine150_ME2639-1000x1000.png?v=637969492295170000',
              'Glutamina',
              'Ninguem Sabe oque ela faz, mas se vc clicar aqui vai saber 👀',
              const telaSuplemento(
                titulo: 'Glutamina',
                rotulo: 'Glutamina',
                subtitulo:
                    'A glutamina apesar de ser um suplemento menos conhecido, tem varios beneficios como fortalecer o seu sistema imunnológico, diminuir reações catabolicas -o catabolismo é, em resumo, a perda de massa muscular-, melhorar a integridade intestinal entre muitos outros. Mas como nada é perfeito, achar uma glutamina de boa qualidade Pode ser razoavelmente caro. Para tomar misture com água, sempre siga as instruções descritas no produto.',
                imagem:
                    'https://www.madrugaosuplementos.com.br/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/r/creatina-integralmedica-300g.png',
              )),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/164114-292-292/HUGER-160-blackwidow-ME3438-1000x1000.png?v=637915068038830000',
              'Pré Treino',
              'Esse daqui vai te deixar louco com certeza',
              const telaSuplemento(
                titulo: 'Pré treino',
                rotulo: 'Pré treino',
                subtitulo:
                    'O pré teino é um dos suplementos mais simples, ele normalmente possui substancias que aumentam a sua força e foco por um curto periodo, tambem diminuindo a sensação de cansaço. MAS PELO AMOR DE DEUS NÃO TOME ELE ATOA, este suplemento tem quantidades MASSIVAS de cafeina, então não sai tomando esse negócio',
                imagem:
                    'https://integralmedica.vteximg.com.br/arquivos/ids/164114-292-292/HUGER-160-blackwidow-ME3438-1000x1000.png?v=637915068038830000',
              )),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/163354-0-0/sinister-mass-baunilha-3kg-integralmedica--1-.png?v=637792343273670000',
              'Hipercalorico',
              'CALORIAS CALORIAS CALORIAS CALORIAS CALORIAS CALORIAS',
              const telaSuplemento(
                titulo: 'Hipercalorico',
                rotulo: 'Hipercalorico',
                subtitulo:
                    'O hipercalorico existe para aquelas pessoas que tem dificuldades em consumir suas calorias diarias ou gabhar peso, nele voce encontra varios outros suplementos misturados em menores quantidades. Para tomar basta misturar com agua ou leite',
                imagem:
                    'https://integralmedica.vteximg.com.br/arquivos/ids/163354-0-0/sinister-mass-baunilha-3kg-integralmedica--1-.png?v=637792343273670000',
              )),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/155755-0-0/aminoacidos-essenciais-eaa-9-limao-155g-integralmedica.png?v=637324204228970000',
              'EAA-9',
              '"Que porra de suplemento é esse que eu nunca vi"',
              const telaSuplemento(
                titulo: 'EAA-9',
                rotulo: 'EAA-9',
                subtitulo:
                    'O EEA-9 é basicamente um suplemento de aminoacidos essenciais que não são produzidos no nosso corpo, mas voce deve estar pensando "Então Marco mas pra que caralhos isso serve", de maneira resumida, voce tera uma melhora significativa em na sua Síntese proteica e na recuperação muscular. Para tomar basta tomar com agua ou leite, sempre siga a quantidade recomendade no rotulo ',
                imagem:
                    'https://integralmedica.vteximg.com.br/arquivos/ids/163354-0-0/sinister-mass-baunilha-3kg-integralmedica--1-.png?v=637792343273670000',
              )),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/159784-0-0/Betalanina.png?v=6375175800958000000',
              'Beta Alanina',
              '"Outro suplemento com nome dificil puta que pariu"',
              const telaSuplemento(
                titulo: 'Beta alanina',
                rotulo: 'Beta alanina',
                subtitulo: '',
                imagem:
                    'https://integralmedica.vteximg.com.br/arquivos/ids/159784-0-0/Betalanina.png?v=6375175800958000000',
              )),
        ]));
  }
}

class listaCapsulas extends StatelessWidget {
  const listaCapsulas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capsulas'),
        backgroundColor: Colors.black38,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black12,
        child: const Icon(Icons.account_balance),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black38,
              ),
              child: Text(
                'Categorias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_filled),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              }
            ),
             ListTile(
              leading: Icon(Icons.ad_units),
              title: Text('Suplementos'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return listaSuplementos();
                }));
              },
            ),
          ],
        ),
      ),
    );
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
  botaoHome(
      {Key? key,
      required this.texto,
      required this.rota,
      required this.texto2,
      required this.rota2})
      : super(key: key);

  final String texto;
  final Widget rota;
  final String texto2;
  final Widget rota2;

  final ButtonStyle estiloBotao = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 23),
      backgroundColor: Colors.black26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return rota;
            }));
          },
          style: estiloBotao,
          child: Text(texto),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return rota2;
            }));
          },
          style: estiloBotao,
          child: Text(texto2),
        )
      ],
    ));
  }
}
