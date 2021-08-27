import 'package:flutter/cupertino.dart';

class DarkModeModel extends ChangeNotifier {
  bool _isDarkMode = false;

  get isDarkMode {
    return _isDarkMode;
  }

  void toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
