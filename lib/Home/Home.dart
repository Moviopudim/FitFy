import 'package:Vitality/Funcoes/contador%20passos.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import '../Config/settings.dart';
import '../agua/agua.dart';
import '/Perguntas/CheckUp.dart';
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

  final controller = PageController(viewportFraction: 0.5, keepPage: true);
  late double percentage = 0;

  void initState() {
    super.initState();
    initPlatformState();
    setState(() {
      percentage = (steps / 6000);
    });
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      steps = event.steps;
      percentage = (steps / 6000);
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
      extendBody: true,
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Seja a Sua',
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Inspiração!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
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
                        children: <Widget>[
                          //Progresso
                          progresso('Passos',percentage, context),
                          progresso('Água', 0.5, context),
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
                          color: Colors.black87
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              'Best Design',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    const Text(
                      'Funções',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Rotas(agua(), 'Água',context),
                          Rotas(formulario(), 'CheckUp',context),
                          Rotas(contadorPassos(), 'Passos',context),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
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
            borderRadius: BorderRadius.circular(20),
            color: Colors.black87
        ),
        child: GestureDetector(
          child: CircularPercentIndicator(
            radius: 70.0,
            lineWidth: 13.0,
            animation: false,
            percent: 1.0,
            center: Text(texto, style: TextStyle(color: Colors.white, fontSize: 25)),
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
    aspectRatio: 2.78 / 3,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          color: Colors.black87
          ),
        child: CircularPercentIndicator(
          radius: 70.0,
          lineWidth: 13.0,
          animation: false,
          percent: porcentagem,
          center: Text(texto, style: TextStyle(color: Colors.white, fontSize: 25)),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.white70,
        ),
      ),
    ),
  );
}
