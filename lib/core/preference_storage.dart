import 'package:shared_preferences/shared_preferences.dart';

import '../utils/Constants.dart';

Future<String?> getPreferenceTheme() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(kPreferredThemeKey);
}

Future<bool> setPreferenceTheme({required String theme}) async {
  final prefs = await SharedPreferences.getInstance();
  return await prefs.setString(kPreferredThemeKey, theme);
}
