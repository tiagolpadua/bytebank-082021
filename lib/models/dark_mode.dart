import 'package:flutter/cupertino.dart';

class DarkModeModel extends ChangeNotifier {
  bool _isDark = false;

  get isDark {
    return _isDark;
  }

  void toggleDarkMode() async {
    _isDark = !_isDark;
    notifyListeners();
  }
}
