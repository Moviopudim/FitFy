import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'dart:async';

import 'package:pedometer/pedometer.dart';
import 'package:Slang/main.dart';

import '../Screens/Home.dart';
import '../Screens/Lista de suplementos.dart';
import '../Screens/listaCapsulas.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class contadorPassos extends StatefulWidget {
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
      _steps = 'Step Count not available';
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
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: GFAppBar(
          title: Text("Home"),
          centerTitle: true,
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
                  leading: Icon(Icons.ad_units_sharp),
                  title: Text('Capsulas'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const listaCapsulas();
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
                style: TextStyle(fontSize: 60),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Estado Atual:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}