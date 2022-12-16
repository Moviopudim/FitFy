import 'package:Slang/Funcoes/perguntaFormulario.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constanst/colors.dart';
import '../Home/Home.dart';
import 'package:flutter/widgets.dart';

import 'Tracker.dart';

class tracker extends StatefulWidget {
  tracker({Key? key}) : super(key: key);

  @override
  _trackerState createState() => _trackerState();
}


class _trackerState extends State<tracker> {
  late List<UserData> dataList = [];

  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),);

  final TextEditingController controladorValor = TextEditingController();
  final TextEditingController controladorDia = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progresso"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Voltar para a home',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home();
            }));
          },
        ),
        actions: <Widget> [
          IconButton(onPressed: () {
            debugPrint('$dataList');
          }, icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: ListView(
        children: <Widget>[
          SfCartesianChart(
              borderWidth: 1,
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Seu Progresso'),
              legend: Legend(isVisible: true),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                LineSeries<UserData, String>(
                    dataSource: dataList,
                    xValueMapper: (dynamic data, _) => data.date,
                    yValueMapper: (dynamic data, _) => data.valor,
                    name: 'Peso (KG)',
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
          TextButton(
            onPressed: () {
                Alert(
                    context: context,
                    title: "Dados",
                    content: Column(
                      children: <Widget>[
                        pergunta(controlador: controladorDia, rotulo: "Data", dica: "Insira a data de hoje"),
                        pergunta(controlador: controladorValor, rotulo: "Valor", dica: "Insira o valor desejado")
                      ],
                    ),
                    buttons:[
                      DialogButton(
                        color: Kamber,
                        onPressed: () async {
                          final double? valor = double.tryParse(controladorValor.text);
                          final String dia = controladorDia.text;
                          final UserData dadosFinais = UserData(dia, valor!);

                          print('Data List: $dataList');

                          Navigator.pop(context);
                        },
                        child: Text(
                          "Confirmar",
                          style: TextStyle(color: Colors.white, fontSize: 20, backgroundColor: Kamber),
                        ),
                      ),
                      DialogButton(
                        color: Kamber,
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ]).show();
                 },
            style: style,
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
class UserData {
  final String date;

  final double valor;

  UserData(
      this.date,
      this.valor
);
}
