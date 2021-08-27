import 'package:bytebank/models/dark_mode.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DarkModeModel(),
      child: BytebankAppWidget(),
    );
  }
}

class BytebankAppWidget extends StatefulWidget {
  @override
  _BytebankAppWidgetState createState() => _BytebankAppWidgetState();
}

class _BytebankAppWidgetState extends State<BytebankAppWidget> {
  // static const DARK_MODE_KEY_PREF = 'darkMode';
  // bool _darkMode = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadDarkModePref();
  // }

  // Future<void> _loadDarkModePref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _darkMode = prefs.getBool(DARK_MODE_KEY_PREF) ?? false;
  //   });
  // }

  // void _saveDarkModePref() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(DARK_MODE_KEY_PREF, _darkMode);
  // }

  @override
  Widget build(BuildContext context) {
    var lightTheme = ThemeData(
      primaryColor: Colors.green[900],
      accentColor: Colors.blueAccent[700],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.blueAccent[700]),
      ),
    );

    return Consumer<DarkModeModel>(builder: (context, darkMode, child) {
      return MaterialApp(
        theme: darkMode.isDark ? ThemeData.dark() : lightTheme,
        // theme: lightTheme,
        home: Dashboard(),
      );
    });
  }

// void toggleDarkMode() async {
//   setState(() {
//     _darkMode = !_darkMode;
//     _saveDarkModePref();
//   });
// }
}
