import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

final String repoURL = 'https://github.com/glorylab/wave';

class agua extends StatefulWidget {
  const agua({Key? key}) : super(key: key);

  @override
  _aguaState createState() => _aguaState();
}

class _aguaState extends State<agua> {
  double marginHorizontal = 16.0;
  late int add = 0;

  @override
  Widget build(BuildContext context) {
    marginHorizontal = 16.0 +
        (MediaQuery.of(context).size.width > 512
            ? (MediaQuery.of(context).size.width - 512) / 2
            : 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Água"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 118),
                Align(
                  child: Container(
                    height: 270,
                    width: 270,
                    decoration:
                        const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 1.5,
                        spreadRadius: -2.0,
                        offset: Offset(8.0, 8.0),
                      ),
                    ]),
                    child: ClipOval(
                      child: WaveWidget(
                        config: CustomConfig(
                          colors: [
                            Colors.blue,
                          ],
                          durations: [
                            5000,
                          ],
                          heightPercentages: [
                            0.5,
                          ],
                        ),
                        backgroundColor: Colors.deepOrangeAccent,
                        size: Size(double.infinity, double.infinity),
                        waveAmplitude: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                Container(
                  height: 32,
                  width: 32,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 130),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              add -= 10;
                            });
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.deepOrangeAccent),
                      Text('$add ml', style: TextStyle(fontSize: 22)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              add += 10;
                            });
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
