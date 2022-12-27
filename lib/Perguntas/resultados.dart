import 'package:flutter/material.dart';
import '../Constanst/colors.dart';
import 'infoCard.dart';

class resultados extends StatelessWidget {

  final String resultadoAgua;
  final String resultadoCreatina;
  final String resultadoImc;
  final String resultadoPassada;
  final String resultadoProteina;
  final String resultadoPi;

  resultados({Key? key, required this.resultadoAgua, required this.resultadoCreatina, required this.resultadoImc, required this.resultadoPi, required this.resultadoPassada, required this.resultadoProteina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Kred,
        title: Text("Resultados"),
        centerTitle: true,
      ),

      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 15,
        primary: true,
        children: <Widget>[
          infoCard(
            rotulo: "Água",
            subtitulo: "A sua quantidade necessaria de agua é " + resultadoAgua + " ml" ,
            imagem: 'https://img.icons8.com/material/344/water-glass.png',
          ),
          infoCard(
            rotulo: "IMC",
            subtitulo: "O seu IMC é: " + resultadoImc ,
            imagem: 'https://img.icons8.com/dotty/344/bmi.png',
          ),
          infoCard(
            rotulo: "Proteina",
            subtitulo: "Voce precisa de " + resultadoProteina + "G " + "De proteina por dia",
            imagem: 'https://img.icons8.com/external-outline-andi-nur-abdillah/344/external-Protein-nutrition-(outline)-outline-andi-nur-abdillah.png',
          ),
          infoCard(
            rotulo: "Creatina",
            subtitulo: "A sua quantidade necessaria de creatina é " + resultadoCreatina + " mg" ,
            imagem: 'https://img.icons8.com/external-tanah-basah-glyph-tanah-basah/344/external-protein-sport-tanah-basah-glyph-tanah-basah.png',
          ),
          infoCard(
            rotulo: "Peso Ideal",
            subtitulo: "O seu peso ideal é: $resultadoPi",
            imagem: 'https://img.icons8.com/ios/344/weight-kg.png',
          ),
          infoCard(
            rotulo: "Passada",
            subtitulo: "O tamanho da sua passada é: " + resultadoPassada,
            imagem: 'https://img.icons8.com/ios-filled/344/right-shoe.png',
          ),
        ],
      )
    );
  }
}

