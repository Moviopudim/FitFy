
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../Home/Home.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  late Box StringBox = Hive.box<String>('UserDataBox');
  late Box IntBox = Hive.box<int>('IntBox');

  late TextEditingController ControladorNome = TextEditingController();
  late TextEditingController ControladorApelido = TextEditingController();
  late TextEditingController ControladorAgua = TextEditingController();
  late TextEditingController ControladorPassos = TextEditingController();

  late int? Agua = int.tryParse(ControladorAgua.text);
  late int? Passos = int.tryParse(ControladorPassos.text);

  late Image? pfp;

  late String DicaNome;
  late String DicaApelido;
  late String DicaAgua;
  late String DicaPassos;

  @override
  void initState(){
    setState(() {
      DicaNome = '${StringBox.get('nome', defaultValue: 'The Rock')}';
      DicaApelido = '${StringBox.get('apelido', defaultValue: 'Nome no Qual Te Chamaremos')}';
      DicaAgua = IntBox.get('meta agua').toString();
      DicaPassos = IntBox.get('meta passos').toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return Home();
            }));
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
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
                    Text(
                      'Configurações',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Edite Seu Nome, Apelido e metas',
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32,),
              buildTextField('Nome Completo', DicaNome, false, ControladorNome),
              buildTextField('Apelido', DicaApelido, false, ControladorApelido),
              buildTextField('Meta Agua', DicaAgua, true, ControladorAgua),
              buildTextField('Meta Passos', DicaPassos, true, ControladorPassos),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0.0, 10, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      onPressed: () {
                        cancel();
                      },
                      child: const Text("CANCELAR",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.red)),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      onPressed: () {
                        save();
                      },
                      child: const Text(
                        "SALVAR",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2,
                            color: Colors.green),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void save(){
    StringBox.put('nome', ControladorNome.text);
    StringBox.put('apelido', ControladorApelido.text);
    IntBox.put('meta agua', Agua);
    IntBox.put('meta passos', Passos);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {},
        ),
        content: const Text('Dados Salvos'),
        duration: const Duration(milliseconds: 1500),
        width: 280.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void cancel(){

  }

  Widget buildTextField(
      String labelText, String placeholder, bool IsNumber, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 25, right: 16),
      child: TextField(
        controller: controller,
        keyboardType: IsNumber != true ? TextInputType.text : TextInputType.number,
        style: TextStyle(color: Colors.black),
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            )),
      ),
    );
  }
}