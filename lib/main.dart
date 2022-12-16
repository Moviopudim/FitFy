import 'package:Slang/Home/Home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Introdução/OnBoard.dart';
import 'package:flutter/widgets.dart';

int? IsViewed;

void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  IsViewed = prefs.getInt('onBoard');

  runApp(slang());
}

class slang extends StatefulWidget {
  const slang({Key? key}) : super(key: key);

  @override
  State<slang> createState() => _SlangState();
}

class _SlangState extends State<slang> {
  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: IsViewed != 0 ? OnBoard() : Home(),
    );
  }
}


