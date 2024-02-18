import 'package:flutter/material.dart';
import 'core/preference_storage.dart';
import 'screens/components/theme_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String preferredTheme = await getPreferenceTheme() ?? 'light';
  runApp(ThemeAppBuilder(preferredTheme: preferredTheme));
}