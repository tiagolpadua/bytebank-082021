import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(BytebankApp());

  // save(Contact(2, 'alex1', 1000)).then((id) {
  //   print('Contato salvo com o id: $id');
  //   findAll().then((contacts) => debugPrint(contacts.toString()));
  // });

  findAll().then((contacts) => debugPrint(contacts.toString()));
}

class BytebankApp extends StatefulWidget {
  bool darkMode = false;

  @override
  _BytebankAppState createState() => _BytebankAppState();
}

class _BytebankAppState extends State<BytebankApp> {
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
      theme: widget.darkMode ? ThemeData.dark() : lightTheme,
      // home: ListaTransferencias(widget.darkMode, toggleDarkMode),
      home: Dashboard(),
    );
  }

  void toggleDarkMode() {
    setState(() {
      widget.darkMode = !widget.darkMode;
    });
  }
}
