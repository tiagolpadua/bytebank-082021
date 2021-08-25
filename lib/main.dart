import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(BytebankApp());
  findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatefulWidget {
  bool _darkMode = false;

  @override
  _BytebankAppState createState() => _BytebankAppState();
}

class _BytebankAppState extends State<BytebankApp> {
  static const DARK_MODE_KEY_PREF = 'darkMode';

  @override
  void initState() {
    super.initState();
    _loadDarkModePref();
  }

  Future<void> _loadDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget._darkMode = prefs.getBool(DARK_MODE_KEY_PREF) ?? false;
    });
  }

  void _saveDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARK_MODE_KEY_PREF, widget._darkMode);
  }

  @override
  Widget build(BuildContext context) {
    var lightTheme = ThemeData(
      primaryColor: Colors.green[900],
      accentColor: Colors.blueAccent[700],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.blueAccent[700]),
      ),
    );

    return MaterialApp(
      theme: widget._darkMode ? ThemeData.dark() : lightTheme,
      home: Dashboard(widget._darkMode, toggleDarkMode),
    );
  }

  void toggleDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    setState(() {
      widget._darkMode = !widget._darkMode;
      _saveDarkModePref();
    });
  }
}
