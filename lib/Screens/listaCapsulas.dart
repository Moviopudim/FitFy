import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import '../Funcoes/DetalhesSuplemento.dart';
import 'Home.dart';
import '../Funcoes/Cria o suplemento.dart';
import 'Lista de suplementos.dart';

class listaCapsulas extends StatelessWidget {
  const listaCapsulas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          title: Text("Home"),
          centerTitle: true,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                    }));
                  }),
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
        body: ListView(children: <Widget>[
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/156791-1000-1000/THERMA_PRO_HARDCORE_60cap.png?v=637324230141300000',
              'Termogenicos',
              'O suplemento que te ajuda a queimar gordura',
              const telaSuplemento(
                  titulo: 'Termogenicos',
                  rotulo: 'Termogenicos',
                  subtitulo:
                      'Os Termogenicos são suplementos que aceleram a sua queima de gordura por um curto periodo. Além de suplementos, temos alimentos com propriedades termogenicas como a pimenta e o café',
                  imagem:
                      'https://integralmedica.vteximg.com.br/arquivos/ids/156791-1000-1000/THERMA_PRO_HARDCORE_60cap.png?v=637324230141300000')),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/156591-0-0/omega-3-60-capsulas-integralmedica.png?v=637335494216730000',
              'Omega 3',
              'Aquele que tem no peixe, sabe?',
              const telaSuplemento(
                  titulo: 'Omega 3',
                  rotulo: 'Omega 3',
                  subtitulo:
                  'A omega 3 é com certeza um suplemento bem famoso, mas será que ele é tudo isso mesmo? Vamos ver. A omega 3 tem MUITAS propriedas positivas como diminuir inflamações, proteger contra doenças cardiacas, combater a asma, entre muitos outros. Alguns alimentos são ricos em omega 3 como peixe, castanhas e nozes.',
                  imagem:
                  'https://integralmedica.vteximg.com.br/arquivos/ids/156591-0-0/omega-3-60-capsulas-integralmedica.png?v=637335494216730000')),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/155715/aminoacido-l-carn-carnitina-60-capsulas-integralmedica.png?v=637324231897800000',
              'L-Cartinina',
              'Mais um suplemento que nínguem conhece, que novidade',
              const telaSuplemento(
                  titulo: 'L-Cartinina',
                  rotulo: 'L-Cartinina',
                  subtitulo:
                  'A cartinina é um aminoacido que apesar de pouco conhecido tem varios beneficios como auxiliar na perda de gordura, melhora na energia muscular, rico em vitaminas B5, entre muitos outros, porem o preço pode sair um pouco salgado.',
                  imagem:
                  'https://integralmedica.vteximg.com.br/arquivos/ids/155715/aminoacido-l-carn-carnitina-60-capsulas-integralmedica.png?v=637324231897800000')),
          criaSuplemento.CriaSuplemento(
              'https://integralmedica.vteximg.com.br/arquivos/ids/162347-1000-1000/COLLAGEN-II-ME3300-1000x1000.png?v=637680268888330000',
              'Colágeno',
              'Em resumo, o suplemento dos idosos',
              const telaSuplemento(
                  titulo: 'Colágeno',
                  rotulo: 'Colágeno',
                  subtitulo:
                  'O colágeno é uma proteina de rapida absorção que é encontrada naturalmento no organismo, ele é responsavel por constituir os tecidos do nosso corpo como, unhas, ligamentos e tendões, e ao passar da idade pode ser necessario a suplementação dessa proteina para manter o bem estar da pessoa',
                  imagem:
                  'https://integralmedica.vteximg.com.br/arquivos/ids/162347-1000-1000/COLLAGEN-II-ME3300-1000x1000.png?v=637680268888330000')),
        ]));
  }
}
