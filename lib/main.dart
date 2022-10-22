import 'package:flutter/material.dart';
import './Screens/Lista de suplementos.dart';
import '../Funcoes/contador passos.dart';

void main() {
  runApp(slang());
}

class slang extends StatelessWidget {
  const slang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            botaoHome('Suplementos', listaSuplementos(), Size.fromHeight(36)),
            botaoHome('Capsulas', listaCapsulas(), Size.fromHeight(36)),
            botaoHome('seus passos', contadorPassos(), Size.fromHeight(18)),
          ],
        ),
      ),
    );
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
    );
  }
}

class botaoHome extends StatelessWidget {
  final String texto;

  final Widget rota;

  botaoHome(this.texto, this.rota, Size size);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return rota;
          }));
        },
        child: Text(texto));
  }
}
