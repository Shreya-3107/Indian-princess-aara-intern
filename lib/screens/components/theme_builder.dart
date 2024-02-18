import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../core/preference_storage.dart';
import '../../custom_widgets/controller.dart';
import '../dashboard/dashboard_screen.dart';
import '../home_page.dart';
import 'app_bar_widget.dart';
import 'theme.dart';

class ThemeAppBuilder extends StatefulWidget {
  final String preferredTheme;
  const ThemeAppBuilder({Key? key, required this.preferredTheme})
      : super(key: key);

  @override
  State<ThemeAppBuilder> createState() => _ThemeAppBuilderState();
}

class _ThemeAppBuilderState extends State<ThemeAppBuilder> {
  String? preferredTheme;

  @override
  void initState() {
    super.initState();
    preferredTheme = widget.preferredTheme;
    setSystemChrome(widget.preferredTheme, getThemeData());
  }

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultTheme: widget.preferredTheme,
        onThemeChanged: (String theme) async {
          if (kDebugMode) {
            print("changed theme $theme");
          }
          setSystemChrome(theme, getThemeData());
          await setPreferenceTheme(theme: theme);
        },
        themeBuilder:
            (BuildContext context, String theme, ThemeData themeData) {
          if (kDebugMode) {
            print("theme data : $theme");
          }
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: Scaffold(
              body: HomePage(theme: theme,),
            ),
          );
        },
        appThemeData: getThemeData());
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
