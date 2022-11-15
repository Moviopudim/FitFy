import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Funcoes/perguntaFormulario.dart';

class tracker extends StatefulWidget {




  tracker({Key? key}) : super(key: key);

  @override
  _trackerState createState() => _trackerState();

}

List dataList = [];

class _trackerState extends State<tracker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          title: Text("Progresso"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            GFIconButton(
              icon: Icon(Icons.refresh_rounded),
              color: Colors.indigo,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => tracker()),
                    (Route<dynamic> route) =>  false,
                );
              }
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return recebeDados();
            })).then((dados){
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
                LineSeries<dynamic, String>(
                    dataSource: dataList,
                    xValueMapper: (dynamic data, _) => data.date,
                    yValueMapper: (dynamic data, _) => data.peso,
                    name: 'Peso (KG)',
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
        ]));
  }
}

class recebeDados extends StatefulWidget {
  @override
  State<recebeDados> createState() => _recebeDadosState();
}

final TextEditingController controladorPeso = TextEditingController();
final TextEditingController controladorDia = TextEditingController();

final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 23), backgroundColor: Colors.transparent);



class _recebeDadosState extends State<recebeDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GFAppBar(
          title: Text("Dados"),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),


        body: Column(
            children: <Widget>[

              pergunta(controlador: controladorPeso, rotulo: 'Peso', dica: 'E.g: 70 kg'),
              pergunta(controlador: controladorDia, rotulo: 'Data', dica: 'E.g: 10/11'),



              OutlinedButton(onPressed:() {
                final double? peso = double.tryParse(controladorPeso.text);
                final String? dia = controladorDia.text;


                final dadosFinais = UserData(dia!, peso!);
                Navigator.pop(context, dadosFinais);
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
