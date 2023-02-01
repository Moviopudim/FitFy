import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../Home/Home.dart';

class treinos extends StatefulWidget {
  const treinos({Key? key}) : super(key: key);

  @override
  State<treinos> createState() => _treinosState();
}

class _treinosState extends State<treinos> {
  final _box = Hive.box<String>('StringBox');
  final List<treino> ListaTreinos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Home();
            }));
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(30))),
            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Seus Treinos',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Registre os Seus Treinos de Uma Maneira Simples',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30),
                ),
              ],
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final treino = await showDialog<String>(
            context: context,
            builder: (context) {
              return AddTreinoDialog();
            },
          );
          if (treino != null) {
            _box.add(treino);
          }
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
class treino{
  late DateTime? data;
  late String? descricao;
  late String? nome;
  late int? series;

  treino(this.data, this.descricao, this.nome, this.series);
  @override
  String toString() {
    return 'transferencia{data: $data, descrição: $descricao, nome: $nome, series: $series}';
  }
}

class TreinoWidget extends StatelessWidget {
  const TreinoWidget({Key? key, required this.Treino}) : super(key: key);

  final treino Treino;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          width: 900,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                Treino.nome.toString(),
                style:
                TextStyle(color: Colors.black, fontSize: 30),
              ),
              SizedBox(height: 5,),
              Text(
                Treino.descricao.toString(),
                style:
                TextStyle(color: Colors.black45, fontSize: 20),
              ), SizedBox(height: 5,),
              Text(
                '${Treino.data} / ${Treino.series}',
                style:
                TextStyle(color: Colors.black45, fontSize: 15),
              ),
            ],
          )
      ),
    );
  }
}

class AddTreinoDialog extends StatefulWidget {
  @override
  _AddTreinoDialogState createState() => _AddTreinoDialogState();
}

class _AddTreinoDialogState extends State<AddTreinoDialog> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Treino'),
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
