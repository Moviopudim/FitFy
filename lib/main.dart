import 'package:Vitality/Home/Home.dart';
import 'package:Vitality/Tracker/Tracker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Introdução/OnBoard.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

int? IsViewed;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<UserData>(UserAdapter());
  await Hive.openBox<String>('UserDataBox');
  await Hive.openBox<List<UserData>>('TrackerBox');

   WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  IsViewed = prefs.getInt('onBoard');

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
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Home',
      theme: ThemeData(
       textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: IsViewed != 0 ? OnBoard() : Home(),
    );
  }
}


