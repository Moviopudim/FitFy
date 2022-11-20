import 'package:Slang/Funcoes/contador%20passos.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Funcoes/CheckUp.dart';
import 'Tracker.dart';
import 'listaReceitas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController(viewportFraction: 0.5, keepPage: true);

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
                    style: TextStyle(color: Colors.white, fontSize: 24),
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