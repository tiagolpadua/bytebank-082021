import 'package:bytebank/models/dark_mode_model.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();
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

    return Consumer<DarkModeModel>(
      builder: (context, darkMode, child) {
        return MaterialApp(
          theme: darkMode.isDarkMode ? ThemeData.dark() : lightTheme,
          home: Dashboard(),
        );
      },
    );
  }
}
