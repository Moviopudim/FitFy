import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
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
  
  List<UserData> dataList = [
    UserData('1', 78),
    UserData('2', 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          actions: <Widget>[
            GFIconButton(
              icon: Icon(Icons.refresh_rounded),
              color: Colors.indigo,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => tracker()),
                      (Route<dynamic> route) => false,
              );
            },)
          ],
          title: Text("Progresso"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<dynamic> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
              return recebeDados();
            }));

           future.then((dados){
              debugPrint('$dados');
              dataList.add(dados);
            });
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
              series:[
                LineSeries<UserData, String>(
                    dataSource: dataList,
                    xValueMapper: (UserData data, _) => data.date,
                    yValueMapper: (UserData data, _) => data.peso,
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

          final double? peso = double.tryParse(controladorPeso.text);
          final String? dia = controladorDia.text;

          if (peso != null && dia != null) {
            final dadosFinais =
              UserData(dia, peso);

            Navigator.pop(context, dadosFinais);
          }
    },
            style: style,
            child: Text('Confirmar'))
       ]
      )
    );
  }
}


class UserData {
  UserData(this.date, this.peso);

  final String date;
  final double peso;
}