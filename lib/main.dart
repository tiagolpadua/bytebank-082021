import 'package:bytebank/screens/contacts/contacts_lista.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:bytebank/screens/transferencia/lista_transferencia.dart';
import 'package:flutter/material.dart';

// CTRL+ALT+L
// ALT+ENTER
void main() => runApp(BytebankApp());

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
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent[700]
          ),
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


