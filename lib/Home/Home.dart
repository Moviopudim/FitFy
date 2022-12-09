import 'dart:ffi';

import 'package:Slang/Funcoes/contador%20passos.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/Perguntas/CheckUp.dart';
import '../Tracker/Tracker.dart';
import '/Receitas/listaReceitas.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  int steps = 100;


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
      steps = event.steps ;
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

    final pages = List.generate(
        4,
            (index) => Container(
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
                 color: colors[index],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SizedBox(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return rotas[index];
                }));
              },
              child: Center(
                  child: Text(
                    telas[index],
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              SizedBox(
                height: 280,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: 32,
                      height: 12,
                      color: Colors.indigo,
                      rotationAngle: 360,
                      verticalOffset: -13,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    dotDecoration: DotDecoration(
                      width: 24,
                      height: 12,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      verticalOffset: 5,
                    ),
                    spacing: 10.0,
                    inActiveColorOverride: (i) => colors[i],
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
        ContainerPlus(
        margin: const EdgeInsets.only(top: 48),
        width: 300,
        height: 300,
        color: Colors.teal,
        radius: RadiusPlus.only(topLeft: 40, bottomRight: 40),
        onTap: () {},
        child:   CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 13.0,
          animation: true,
          percent: steps >= 6000 ? 1.0 : percentage,
          center: Text(
            (percentage * 100).toStringAsPrecision(3),
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          footer: Text(
            steps.toString(),
            style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.green,
        ),
      ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

const colors = [
  Colors.amber,
  Colors.red,
  Colors.teal,
  Colors.cyan,
];

const telas = [
  'Tracker',
  'CheckUp',
  'Passos',
  'Receitas'
];

List<dynamic> rotas = [
  tracker(),
  formulario(),
  contadorPassos(),
  ListaReceita(),
];

