import 'package:Vitality/Home/Home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Introdução/inicio.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

var BoolBox = Hive.box<bool>("BoolBox");

bool? IsViewed = BoolBox.get('isSeen');

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>('UserDataBox');
  await Hive.openBox<String>('StringBox');
  await Hive.openBox<bool>('BoolBox');
  await Hive.openBox<double>('DoubleBox');
  await Hive.openBox<int>('IntBox');

  WidgetsFlutterBinding.ensureInitialized();

  runApp(Vitality());
}

class Vitality extends StatefulWidget {
  const Vitality({Key? key}) : super(key: key);

  @override
  State<Vitality> createState() => _SlangState();
}

class _SlangState extends State<Vitality> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Home',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoCondensedTextTheme(),
      ),
      home: LoginPage(),
    );
  }
}
