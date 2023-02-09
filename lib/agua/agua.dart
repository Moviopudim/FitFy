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
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      )));

  var DoubleBox = Hive.box<double>("DoubleBox");
  var IntBox = Hive.box<int>("IntBox");

  late int add = 0;
  late int consumido = 0;
  late int meta = 2200;
  late double Porcentagem = 1;
  late double PorcentagemUsuario = 0;

  @override
  void initState() {
    var DoubleBox = Hive.box<double>("DoubleBox");
    var IntBox = Hive.box<int>("IntBox");

    setState(() {
      Porcentagem = 1.0 - (consumido / meta);
      Porcentagem = DoubleBox.get("porcentagem", defaultValue: 1.0)!;
      PorcentagemUsuario = DoubleBox.get("porcentagemUser", defaultValue: 0)!;
      consumido = IntBox.get("consumido", defaultValue: 0)!;
    });
  }

  void adicionar() {

    consumido += add;

    if (consumido <= -1) {
      consumido = 0;
    }

    setState(() {
      Porcentagem = 1.0 - (consumido / meta);
      meta = IntBox.get('meta agua', defaultValue: 2200)!;
      PorcentagemUsuario = ((consumido / meta) * 100);
    });

    DoubleBox.put('porcentagem', Porcentagem);
    DoubleBox.put('porcentagemUser', PorcentagemUsuario);
    IntBox.put('consumido', consumido);
  }

  void reset() {
    var DoubleBox = Hive.box<double>("DoubleBox");
    var IntBox = Hive.box<int>("IntBox");

    setState(() {
      DoubleBox.put('porcentagem', 100.0);
      DoubleBox.put('porcentagemUser', 0);
      IntBox.put('consumido', 0);

      Porcentagem = DoubleBox.get("porcentagem", defaultValue: 1.0)!;
      PorcentagemUsuario = DoubleBox.get("porcentagemUser", defaultValue: 0)!;
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
                  SizedBox(height: 7),
                  Text(
                    'Acompanhe a sua quantidade de agua consumida durante o dia',
                    style: TextStyle(color: Colors.black45, fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.white,
                shadowColor: Colors.black45,
                elevation: 7,
                side: BorderSide(width: 0.5),
              ),
              onPressed: () {
                reset();
              },
              child: Text('Resetar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(22),
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
                            heightPercentages: [Porcentagem],
                          ),
                          backgroundColor: Colors.black54,
                          size: Size(double.infinity, double.infinity),
                          waveAmplitude: 0,
                        ),
                      ),
                    ),
                  ), const SizedBox(
                    height: 15,
                  ),
                  Text(consumido >= 0 ? '${consumido}ml' : '0ml',  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                  Text('${PorcentagemUsuario.toStringAsPrecision(3)}%',  style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: Colors.white,
                      shadowColor: Colors.black45,
                      elevation: 7,
                      side: BorderSide(width: 0.5),
                    ),
                    onPressed: () {
                      adicionar();
                    },
                    child: Text(add >= 0 ? 'Adicionar' : 'Remover',  style: TextStyle(color: Colors.black)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black45,
                          elevation: 7,
                          side: BorderSide(width: 0.5),
                        ),
                        onPressed: () {
                          setState(() {
                            add -= 10;
                          });
                        },
                        child: Text('-', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${add}ml',
                        style: TextStyle(color: Colors.black87, fontSize: 32),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            backgroundColor: Colors.white,
                            shadowColor: Colors.black45,
                            elevation: 7,
                            side: BorderSide(width: 0.5),
                          ),
                          onPressed: () {
                            setState(() {
                              add += 10;
                            });
                          },
                          child: const Text('+', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
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
