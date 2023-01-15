import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Home/Home.dart';

class tracker extends StatefulWidget {
  const tracker({Key? key}) : super(key: key);

  @override
  State<tracker> createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  List<UserData> dataList = [
    UserData(10, 70),
    UserData(11, 75),
    UserData(12, 69),
    UserData(13, 65),
  ];

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
              return const Home();
            }));
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
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
                    'Tracker',
                    style: TextStyle(color: Colors.black87, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rastreie o Seu peso, altura, progresso na academia com Graficos Interativos',
                    style: TextStyle(color: Colors.black45, fontSize: 22),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Em Breve.',
              style: TextStyle(color: Colors.black45, fontSize: 42),
            ),
          ],
        ),
      ),
    );
  }
}

class UserData {
  UserData(this.date, this.valor);
  final int date;
  final int valor;
}
