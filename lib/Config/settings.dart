import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../Home/Home.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool dark = false;
  List<int> MetaPassos = <int>[6000, 7000, 8000, 9000, 10000];

  late String? idade;
  late String? altura;
  late String? peso;



  @override
  void initState(){
    var box = Hive.box<String>('UserDataBox');

    setState(() {
      idade = box.get('idade');
      altura = box.get('altura');
      peso = box.get('peso');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25))),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Configurações',
                    style: TextStyle(color: Colors.black87, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mude Metas e Preferencias',
                    style: TextStyle(color: Colors.black45, fontSize: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text('Metas',  style: TextStyle(color: Colors.black87, fontSize: 38, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20,),
                  config('Meta de Agua Diaria')
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

Widget config(texto){
  return  Container(
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Align(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                texto,
                style:
                TextStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle, color: Colors.black,)),
                  Text('0', style: TextStyle(color: Colors.black87, fontSize: 28)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle, color: Colors.black))
                ],
              )
            ],
          )
        ),
      ),
    )
  );
}
