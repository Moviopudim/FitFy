import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class agua extends StatefulWidget {
  const agua({Key? key}) : super(key: key);

  @override
  State<agua> createState() => _aguaState();
}

class _aguaState extends State<agua> {
  final ButtonStyle style =
   ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 30),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agua"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            heightFactor: 1.5,
            child: CircularPercentIndicator(
              radius: 160.0,
              lineWidth: 13.0,
              animation: false,
              percent: 0.7,
              center: const Text(
                '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: const Text(
                'ml: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              progressColor: Colors.blue,
            ),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: Text('+50'),
          ),
          TextButton(
            style: style,
            onPressed: () {},
            child: Text('+100'),
          )
        ],
      ),
    );
  }
}
