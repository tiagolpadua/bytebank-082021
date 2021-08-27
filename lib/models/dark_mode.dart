import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeModel extends ChangeNotifier {
  static const DARK_MODE_KEY_PREF = 'darkMode';

  bool _isDark = false;

  DarkModeModel() {
    _loadDarkModePref();
  }

  get isDark {
    return _isDark;
  }

  Future<void> _loadDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool(DARK_MODE_KEY_PREF) ?? false;
    notifyListeners();
  }

  void _saveDarkModePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARK_MODE_KEY_PREF, _isDark);
  }

  void toggleDarkMode() async {
    _isDark = !_isDark;
    _saveDarkModePref();
    notifyListeners();
  }
}
