import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeModel extends ChangeNotifier {
  static const DARK_MODE_KEY_PREF = 'darkMode';
  DarkModeModel() {
    _loadDarkModePref();
  }
  bool _isDarkMode = false;

  get isDarkMode {
    return _isDarkMode;
  }
  void toggleDarkMode() async {
    _isDarkMode = !_isDarkMode;
    _saveDarkModePref();
    notifyListeners();
  }

  Future<void> _loadDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(DARK_MODE_KEY_PREF) ?? false;
    notifyListeners();
  }

  void _saveDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARK_MODE_KEY_PREF, _isDarkMode);
  }
}
