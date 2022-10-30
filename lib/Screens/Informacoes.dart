import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class resultados extends StatelessWidget {
  const resultados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text("Resultados"),
        centerTitle: true,
      ),
    );
  }
}
