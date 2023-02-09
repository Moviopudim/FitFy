import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Home/Home.dart';

class tracker extends StatefulWidget {
  const tracker({Key? key}) : super(key: key);

  @override
  State<tracker> createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  List<UserData> dataList = [
    UserData('10', 70),
    UserData('11', 75),
    UserData('12', 69),
    UserData('13', 65),
  ];

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
              return const Home();
            }));
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      body: SafeArea(
        child: ListView(
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
                      'Tracker',
                      style: TextStyle(color: Colors.black87, fontSize: 32),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rastreie o Seu peso, altura, progresso na academia com Graficos Interativos',
                      style: TextStyle(color: Colors.black45, fontSize: 22),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SfCartesianChart(
                  borderWidth: 1,
                  primaryXAxis: CategoryAxis(),
                  title: ChartTitle(text: 'Seu Progresso'),
                  legend: Legend(isVisible: true),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series:[
                    LineSeries<dynamic, String>(
                        dataSource: dataList,
                        xValueMapper: (dynamic data, _) => data.date,
                        yValueMapper: (dynamic data, _) => data.valor,
                        name: 'Peso (KG)',
                        dataLabelSettings: const DataLabelSettings(isVisible: true))
                  ]),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black45,
                  elevation: 2,
                  side: BorderSide(width: 0.2),
                ),
                onPressed: () {
                  AddDialog();
                },
                child: Text('Adicionar a Este Grafico', style: TextStyle(color: Colors.black)),
              ),
            ],
        ),
      ),
    );
  }
}

class UserData {
  UserData(this.date, this.valor);
  final String? date;
  final double valor;
}

class AddDialog extends StatefulWidget {
  @override
  _AddDialogState createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Informações'),
      content: TextField(
        controller: _textController,
        autofocus: true,
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(_textController.text);
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
