import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class telaSuplemento extends StatelessWidget {
  const telaSuplemento({Key? key,
    required this.titulo,
    required this.rotulo,
    required this.subtitulo,
    required this.imagem})
      : super(key: key);

  final String titulo;
  final String rotulo;
  final String subtitulo;
  final String imagem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(titulo),
        buttonStyle: NeumorphicStyle(depth: 3),
      ),
      body: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(24)),
            depth: 8,
            lightSource: LightSource.topLeft,
        ),
        child: Card(
          child: ListTile(
            leading: Image.network(
              imagem,
              width: 50,
              height: 150,
            ),
            title: NeumorphicText(
              rotulo,
              style: const NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: 8,
                color: Colors.white,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 32,
              ),
            ),
            subtitle:
            NeumorphicText(
              subtitulo,
              style: const NeumorphicStyle(
                depth: 6,
                color: Colors.white,
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 20, //customize size here
              ),
            ),
          ),
        ),
      ),
    );
  }
}