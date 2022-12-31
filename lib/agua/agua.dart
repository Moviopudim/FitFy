import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../Home/Home.dart';

class agua extends StatefulWidget {
  const agua({Key? key}) : super(key: key);

  @override
  State<agua> createState() => _aguaState();
}

class _aguaState extends State<agua> {
  final ButtonStyle style = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(5)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black54),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      )));

  late int add = 0;
  late int consumido = 0;
  late int meta = 2200;
  late double percentage = 1;

  @override
  void initState() {
    var DoubleBox = Hive.box<double>("DoubleBox");
    var IntBox = Hive.box<int>("IntBox");

    setState(() {
      percentage = DoubleBox.get("porcentagem", defaultValue: 1.0)!;
      consumido = IntBox.get("consumido", defaultValue: 0)!;
    });
  }

  void change() {
    var DoubleBox = Hive.box<double>("DoubleBox");
    var IntBox = Hive.box<int>("IntBox");

    consumido += add;

    if (consumido <= -1) {
      consumido = 0;
    }

    setState(() {
      percentage = 1.0 - (consumido / meta);
    });

    DoubleBox.put('porcentagem', percentage);
    IntBox.put('consumido', consumido);
  }

  void reset() {
    var DoubleBox = Hive.box<double>("DoubleBox");
    var IntBox = Hive.box<int>("IntBox");

    setState(() {
      DoubleBox.put('porcentagem', 100.0);
      IntBox.put('consumido', 0);

      percentage = DoubleBox.get("porcentagem", defaultValue: 1.0)!;
      consumido = IntBox.get("consumido", defaultValue: 0)!;
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
                    'Água',
                    style: TextStyle(color: Colors.black87, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Acompanhe a sua quantidade de agua consumida durante o dia',
                    style: TextStyle(color: Colors.black45, fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: style,
              onPressed: () {
                reset();
              },
              child: Text('Resetar'),
            ),
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    child: Container(
                      height: 258,
                      width: 258,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10.0,
                              offset: Offset(0.0, 8.0),
                            ),
                          ]),
                      child: ClipOval(
                        child: WaveWidget(
                          config: CustomConfig(
                            colors: [
                              Colors.white,
                            ],
                            durations: [
                              10000,
                            ],
                            heightPercentages: [percentage],
                          ),
                          backgroundColor: Colors.black54,
                          size: Size(double.infinity, double.infinity),
                          waveAmplitude: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      change();
                    },
                    child: Text(add >= 0 ? 'Adicionar' : 'Remover'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: style,
                        onPressed: () {
                          setState(() {
                            add -= 10;
                          });
                        },
                        child: Text('-'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '$add',
                        style: TextStyle(color: Colors.black87, fontSize: 32),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          style: style,
                          onPressed: () {
                            setState(() {
                              add += 10;
                            });
                          },
                          child: const Text('+')),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
