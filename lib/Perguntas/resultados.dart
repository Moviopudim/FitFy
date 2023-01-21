import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Constanst/colors.dart';
import '../Home/Home.dart';

class resultados extends StatelessWidget {
  final String resultadoAgua;
  final String resultadoCreatina;
  final String resultadoImc;
  final String resultadoProteina;
  final String resultadoPi;

  resultados(
      {Key? key,
      required this.resultadoAgua,
      required this.resultadoCreatina,
      required this.resultadoImc,
      required this.resultadoPi,
      required this.resultadoProteina})
      : super(key: key);

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
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
        body: SafeArea(
          child: Column(
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
                      'Resultados',
                      style: TextStyle(color: Colors.black87, fontSize: 52),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22,),
              Card('Quantidade de Proteina: ${resultadoProteina}g', context),
              const SizedBox(height: 12,),
              Card('Quantidade Creatina: ${resultadoCreatina}g', context),
              const SizedBox(height: 12,),
              Card('Quantidade de Água: ${resultadoAgua}ml', context),
              const SizedBox(height: 12,),
              Card('Imc: ${resultadoImc}', context),
              const SizedBox(height: 12,),
              Card('Peso Ideal : ${resultadoPi}Kg', context),
            ],
          ),
        ));
  }
}

Widget Card(texto, context) {
  return AspectRatio(
    aspectRatio: 12 / 3,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Text(
            texto,
            style: TextStyle(
              fontSize: 22
            ),
          )),
    ),
  );
}
