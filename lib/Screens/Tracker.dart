import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../Funcoes/perguntaFormulario.dart';

class tracker extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  tracker({Key? key}) : super(key: key);

  @override
  _trackerState createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  
  List<_UserData> dataList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          title: Text("Progresso"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return recebeDados();
            }));
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),

        body: ListView(children: <Widget> [

          SfCartesianChart(
            borderWidth: 1,
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Seu Progresso'),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_UserData, String>>[
                LineSeries<_UserData, String>(
                    dataSource: dataList,
                    xValueMapper: (_UserData sales, _) => sales.date,
                    yValueMapper: (_UserData sales, _) => sales.peso,
                    name: 'Peso (KG)',
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),

        ]));
  }
}

class recebeDados extends StatelessWidget {

  final TextEditingController controladorPeso = TextEditingController();
  final TextEditingController controladorDia = TextEditingController();

  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 23), backgroundColor: Colors.transparent);

  recebeDados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Dados"),
        centerTitle: true,
      ),

      
      body: Column(
      children: <Widget>[

        pergunta(controlador: controladorPeso, rotulo: 'Peso', dica: 'E.g: 70 kg'),
        pergunta(controlador: controladorDia, rotulo: 'Data', dica: 'E.g: 10/11'),

        OutlinedButton(onPressed:() {
          final String data = controladorDia.text as String;
          final double peso = controladorPeso.value as double;


          debugPrint('Dia: $data');
          debugPrint('Peso: $peso');

        },
            style: style,
            child: Text('Confirmar'))
       ]
      )
    );
  }
}


class _UserData {
  _UserData(this.date, this.peso);

  final String date;
  final double peso;
}