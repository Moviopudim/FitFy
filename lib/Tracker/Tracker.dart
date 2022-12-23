import 'package:Vitality/Funcoes/perguntaFormulario.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constanst/colors.dart';
import '../Home/Home.dart';
import 'package:flutter/widgets.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  String date;

  @HiveField(1)
  double valor;

  UserData(this.date, this.valor);
}

class tracker extends StatefulWidget {
  tracker({Key? key}) : super(key: key);

  @override
  _trackerState createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  late List<UserData> dataList = [];
  var box = Hive.box<List<UserData>>('TrackerBox');

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
  );

  final TextEditingController controladorValor = TextEditingController();
  final TextEditingController controladorDia = TextEditingController();

  @override
  void initState() {

    super.initState();
  }
  void insert(dados) {
    dataList.add(dados);
    box.put('tracker', dataList);
    debugPrint('inserido');
  }

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
        actions: <Widget>[
          IconButton(
              onPressed: () {
                debugPrint('$dataList');
              },
              icon: const Icon(Icons.refresh_rounded))
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
                    dataSource: box.get('tracker'),
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
                      pergunta(
                          controlador: controladorDia,
                          rotulo: "Data",
                          dica: "Insira a data de hoje"),
                      pergunta(
                          controlador: controladorValor,
                          rotulo: "Valor",
                          dica: "Insira o valor desejado")
                    ],
                  ),
                  buttons: [
                    DialogButton(
                      color: Kamber,
                      onPressed: () async {
                        final double? valor =
                            double.tryParse(controladorValor.text);
                        final String dia = controladorDia.text;
                        final UserData dadosFinais = UserData(dia, valor!);

                        print('Data List: $dataList');

                        insert(dadosFinais);


                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => tracker()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        "Confirmar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            backgroundColor: Kamber),
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

class UserAdapter extends TypeAdapter<UserData> {
  @override
  final typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    return UserData(reader.readString(), reader.readDouble());
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer.write(obj.date);
    writer.write(obj.valor);
  }
}

