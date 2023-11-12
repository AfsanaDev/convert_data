import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  Locale? _appLocale;

  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale = type;
    if (type == const Locale('en')) {
      await sp.setString('language_code', 'en');
    } else if (type == const Locale('es')) {
      await sp.setString('language_code', 'es');
    } else {
      await sp.setString('language_code', 'bn');
    }
    notifyListeners();
  }
}
