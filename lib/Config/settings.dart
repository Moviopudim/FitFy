import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool dark = false;

  List<int> list = <int>[6000, 7000, 8000, 9000, 10000];

  @override
  Widget build(BuildContext context) {
    int meta = list.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progresso"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: <Widget>[
            const Card(
              child: ListTile(
                title: Text(
                  'Idade: ',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32),
                ),
                subtitle: Text('Idade do usuario',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                leading: Icon(
                  Icons.numbers_outlined,
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
                items: list.map<DropdownMenuItem<int>>((int value) {
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
