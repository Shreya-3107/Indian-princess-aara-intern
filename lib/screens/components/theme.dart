import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../custom_widgets/colors.dart';

AppThemeData getThemeData() {
  final ThemeData darkThemeBase = ThemeData.dark();

  ThemeData darkTheme = darkThemeBase.copyWith(
      primaryColor: kBackgroundDark,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: kAppbarBackgroundDark,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark),
      colorScheme: _customColorSchemeDark);

  final ThemeData lightThemeBase = ThemeData.light();
  ThemeData lightTheme = lightThemeBase.copyWith(
      primaryColor: kBackgroundLight,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: const TextTheme(
          // headline1: TextStyle(color: Colors.black),
          // headline2: TextStyle(color: Colors.black),
          // bodyText2: TextStyle(color: Colors.black),
          // subtitle1: TextStyle(color: Colors.black),
          // caption: TextStyle(color: Colors.black),
          // bodyText1: TextStyle(color: Colors.black),
          ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      colorScheme: _customColorSchemeLight);
  return AppThemeData(
      dark: darkTheme,
      light: lightTheme,
      darkThemeOverlay: const SystemUiOverlayStyle(
        statusBarColor: kAppbarBackgroundDark,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: kBackgroundDark,
        systemNavigationBarColor: kBackgroundDark,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      lightThemeOverlay: const SystemUiOverlayStyle(
        statusBarColor: kAppbarBackgroundLight,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: kBackgroundLight,
        systemNavigationBarColor: kBackgroundLight,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ));
}

ColorScheme _customColorSchemeLight = const ColorScheme(
  primary: kBackgroundLight,
  // primaryVariant: customMagenta600,
  secondary: Colors.amber,
  // secondaryVariant: customMagenta400,
  surface: Colors.purpleAccent,
  background: kBackgroundLight,
  error: Colors.redAccent,
  onPrimary: Colors.white,
  onSecondary: Colors.deepOrange,
  onSurface: kBackgroundLight,
  onBackground: kBackgroundLight,
  onError: Colors.redAccent,
  brightness: Brightness.light,
);

ColorScheme _customColorSchemeDark = const ColorScheme(
  primary: kBackgroundDark,
  // primaryVariant: customMagenta600,
  secondary: Colors.amber,
  // secondaryVariant: customMagenta400,
  surface: Colors.purpleAccent,
  background: kBackgroundDark,
  error: Colors.redAccent,
  onPrimary: Colors.white,
  onSecondary: Colors.deepOrange,
  onSurface: kBackgroundDark,
  onBackground: kBackgroundDark,
  onError: Colors.redAccent,
  brightness: Brightness.dark,
);

class AppTheme {
  static buildDarkTheme() {
    final ThemeData darkThemeBase = ThemeData.dark();
    return darkThemeBase.copyWith(
        primaryColor: kBackgroundDark,
        appBarTheme: const AppBarTheme(
            backgroundColor: kAppbarBackgroundDark,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark));
  }

  static buildLightTheme() {
    final ThemeData lightThemeBase = ThemeData.light();
    return lightThemeBase.copyWith(
        primaryColor: kBackgroundLight,
        appBarTheme: const AppBarTheme(
            backgroundColor: kAppbarBackgroundLight,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light));
  }
}

class AppThemeData {
  final ThemeData dark;
  final ThemeData light;
  final SystemUiOverlayStyle darkThemeOverlay;
  final SystemUiOverlayStyle lightThemeOverlay;
  AppThemeData(
      {required this.dark,
      required this.light,
      required this.darkThemeOverlay,
      required this.lightThemeOverlay});
}

typedef OnThemeChangeCallback = void Function(String theme);

typedef DynamicThemeBuilder = Widget Function(
    BuildContext context, String theme, ThemeData themeData);

class DynamicTheme extends StatefulWidget {
  final String defaultTheme;
  final OnThemeChangeCallback? onThemeChanged;
  final DynamicThemeBuilder themeBuilder;
  final AppThemeData appThemeData;
  const DynamicTheme(
      {Key? key,
      required this.defaultTheme,
      this.onThemeChanged,
      required this.themeBuilder,
      required this.appThemeData})
      : super(key: key);

  @override
  State<DynamicTheme> createState() => DynamicThemeState();
  // ignore: library_private_types_in_public_api
  static DynamicThemeState? of(BuildContext context) {
    return context.findAncestorStateOfType<DynamicThemeState>();
  }
}

class DynamicThemeState extends State<DynamicTheme> {
  String? _theme;
  String get theme => _theme ?? "";
  @override
  void initState() {
    super.initState();
    _theme = widget.defaultTheme;
  }

  set theme(String t) {
    setState(() {
      _theme = t;
    });
    if (widget.onThemeChanged != null) {
      widget.onThemeChanged!(t);
    }
  }

  getThemeData(String t) {
    if (t.toLowerCase() == 'dark') {
      return widget.appThemeData.dark;
    } else {
      return widget.appThemeData.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.themeBuilder(context, theme, getThemeData(theme));
  }
}

setSystemChrome(String theme, AppThemeData data) {
  if (theme == 'light') {
    SystemChrome.setSystemUIOverlayStyle(data.lightThemeOverlay);
  } else {
    SystemChrome.setSystemUIOverlayStyle(data.darkThemeOverlay);
  }
}
