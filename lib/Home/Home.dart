import 'package:Vitality/Funcoes/contador%20passos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:pedometer/pedometer.dart';
import '../CheckUP/CheckUp.dart';
import '../Config/profile.dart';
import '../Tracker/Tracker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../agua/agua.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int steps = 0;

  late Box StringBox = Hive.box<String>('UserDataBox');
  late Box IntBox = Hive.box<int>('IntBox');
  late Box DoubleBox = Hive.box<double>('DoubleBox');

  late String nome = 'Marco';

  final controller = PageController(viewportFraction: 0.5, keepPage: true);
  late double Porcentagem = 0;
  late double PorcentagemAgua = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    setState(() {
      Porcentagem = (steps / IntBox.get('meta passos', defaultValue: 6000));

      PorcentagemAgua =
          (DoubleBox.get('porcentagemUser', defaultValue: 0.0)) / 100;
    });
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      steps = event.steps;
      Porcentagem = (steps / 6000);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      steps = 0;
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return settings();
            }));
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      extendBody: true,
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: SafeArea(
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Bom dia',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      nome,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Seu Progresso',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          progresso('Passos', Porcentagem, context),
                          progresso('Água', PorcentagemAgua, context),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Alugue Este Espaço e Anuncie o Seu Produto!',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Funções',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Rotas(agua(), 'Água', context),
                          Rotas(tracker(), 'Tracker', context),
                          Rotas(formulario(), 'CheckUp', context),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget Rotas(rota, texto, context) {
  return AspectRatio(
    aspectRatio: 2.62 / 3,
    child: Container(
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: GestureDetector(
          child: CircularPercentIndicator(
            radius: 70.0,
            lineWidth: 13.0,
            animation: false,
            percent: 1.0,
            center: Text(texto,
                style: TextStyle(color: Colors.black, fontSize: 25)),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.white70,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return rota;
            }));
          },
        ),
      ),
    ),
  );
}

Widget progresso(texto, porcentagem, context) {
  return AspectRatio(
    aspectRatio: 2.5 / 3,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: CircularPercentIndicator(
          radius: 70.0,
          lineWidth: 13.0,
          animation: false,
          percent: porcentagem,
          center:
              Text(texto, style: TextStyle(color: Colors.black, fontSize: 25)),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.white60,
        ),
      ),
    ),
  );
}
