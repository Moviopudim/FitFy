import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool dark = false;
  List<int> MetaPassos = <int>[6000, 7000, 8000, 9000, 10000];

  late String? idade;
  late String? altura;
  late String? peso;



  @override
  void initState(){
    var box = Hive.box<String>('UserDataBox');

    setState(() {
      idade = box.get('idade');
      altura = box.get('altura');
      peso = box.get('peso');
    });
  }

  @override
  Widget build(BuildContext context) {
    int meta = MetaPassos.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: <Widget>[
             Card(
              child: ListTile(
                title: Text(
                  'Idade: $idade',
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                ),
                subtitle: const Text('Idade do usuario',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                leading: const Icon(
                  Icons.numbers_outlined,
                  size: 50,
                ),
              ),
            ),Card(
              child: ListTile(
                title: Text(
                  'Peso: $peso',
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                ),
                subtitle: const Text('peso do usuario',
                    style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                leading: const Icon(
                  Icons.monitor_weight,
                  size: 50,
                ),
              ),
            ),Card(
              child: ListTile(
                title: Text(
                  'Altura: $altura',
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                ),
                subtitle: const Text('Altura do usuario',
                    style:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                leading: const Icon(
                  Icons.height,
                  size: 50,
                ),
              ),
            ),
            Card(
              child: ListTile(
                  leading: const Icon(
                    Icons.shield_moon_rounded,
                    size: 50,
                  ),
                  title: const Text(
                    'Modo Escuro',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                  ),
                  subtitle: const Text('Desabilita ou Habilita o modo escuro',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  trailing: Switch(
                    value: dark,
                    activeColor: Colors.indigo,
                    onChanged: (bool value) {
                      setState(() {
                        dark = value;
                      });
                    },
                  )),
            ),

            Card(
                child: ListTile(
              leading: const Icon(
                Icons.directions_run_rounded,
                size: 50,
              ),
              title: const Text(
                'Meta de Passos',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
              ),
              subtitle: const Text('Defina a sua meta de passos',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
              trailing: DropdownButton<int>(
                items: MetaPassos.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                onChanged: (int? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    meta = value!;
                  });
                },
                value: meta,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
