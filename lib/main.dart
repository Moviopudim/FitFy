import './Screens/Lista de suplementos.dart';
import 'package:sang/Screens/Home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(slang());
}

class slang extends StatelessWidget {
  const slang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      title: 'Home',
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
        baseColor: Colors.black12,
        lightSource: LightSource.topLeft,
        shadowDarkColor: Colors.black45,
        depth: 6,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: MyHomePage(),
    );
  }
}


class botaoHome extends StatelessWidget {
  final String texto;

  final Widget rota;

  botaoHome(this.texto, this.rota, Size size);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        margin: EdgeInsets.only(top: 12),
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return rota;
          }));
        },
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          texto,
          style: TextStyle(color: Colors.white),
        ));
  }
}
