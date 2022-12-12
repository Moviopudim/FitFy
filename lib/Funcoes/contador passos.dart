import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';

import '../Constanst/colors.dart';
String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class contadorPassos extends StatefulWidget {
  const contadorPassos({super.key});

  @override
  _contadorPassosState createState() => _contadorPassosState();
}

class _contadorPassosState extends State<contadorPassos> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
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
      _steps = 'Erro ao detectar seus passos';
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
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Passos"),
          centerTitle: true,
          backgroundColor: Kteal,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Passos:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: const TextStyle(fontSize: 60),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}