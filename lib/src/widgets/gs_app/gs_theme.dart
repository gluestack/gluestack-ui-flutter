import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GSTheme extends StatelessWidget {
  const GSTheme({
    super.key,
    required this.data,
    required this.child,
  });

  final GSThemeData data;
  final Widget child;

  static GSThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_GSTheme>()!.data;
  }

  static GSThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_GSTheme>()?.data;
  }

  @override
  Widget build(BuildContext context) {
    return _GSTheme(
      data: data,
      child: child,
    );
  }
}

class _GSTheme extends InheritedTheme {
  const _GSTheme({
    required this.data,
    required super.child,
  });

  final GSThemeData data;

  @override
  bool updateShouldNotify(covariant _GSTheme oldWidget) =>
      oldWidget.data != data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _GSTheme(data: data, child: child);
  }
}

class GSThemeWidget extends StatelessWidget {
  final GSThemeData data;
  final Widget child;
  const GSThemeWidget({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GSTheme(
      data: data,
      child: child,
    );
  }
}

// extension BrightnessExtension on Brightness {
//   bool get isLight => this == Brightness.light;

//   bool get isDark => this == Brightness.dark;
//   Brightness get opposite => isLight ? Brightness.dark : Brightness.light;
// }

// const standardCurve = Curves.easeInOut;

enum GSThemes { light, dark, red, blue, green }

class GSThemeData {
  GSThemes theme;
  Color? primary0;
  Color? primary50;
  Color? primary100;
  Color? primary200;
  Color? primary300;
  Color? primary400;
  Color? primary500;
  Color? primary600;
  Color? primary700;
  Color? primary800;
  Color? primary900;
  Color? primary950;
  Color? secondary0;
  Color? secondary50;
  Color? secondary100;
  Color? secondary200;
  Color? secondary300;
  Color? secondary400;
  Color? secondary500;
  Color? secondary600;
  Color? secondary700;
  Color? secondary800;
  Color? secondary900;
  Color? secondary950;
  GSThemeData({
    this.theme = GSThemes.light,
    this.primary0,
    this.primary50,
    this.primary100,
    this.primary200,
    this.primary300,
    this.primary400,
    this.primary500,
    this.primary600,
    this.primary700,
    this.primary800,
    this.primary900,
    this.primary950,
    this.secondary0,
    this.secondary50,
    this.secondary100,
    this.secondary200,
    this.secondary300,
    this.secondary400,
    this.secondary500,
    this.secondary600,
    this.secondary700,
    this.secondary800,
    this.secondary900,
    this.secondary950,
  });

  factory GSThemeData.fromTheme(GSThemes theme) {
    switch (theme) {
      case GSThemes.dark:
        return GSThemeData(
          theme: GSThemes.dark,
          primary0: const Color(0xFF828282),
          primary50: const Color(0xFF949494),
          primary100: const Color(0xFF9E9E9E),
          primary200: const Color(0xFFB3B3B3),
          primary300: const Color(0xFFC7C7C7),
          primary400: const Color(0xFFE6E6E6),
          primary500: const Color(0xFFF0F0F0),
          primary600: const Color(0xFFFAFAFA),
          primary700: const Color(0xFFFCFCFC),
          primary800: const Color(0xFFDFDFDF),
          primary900: const Color(0xFFDCFCFC),
          primary950: const Color(0xFFDCFCFC),
          secondary0: const Color(0xFF0B0C0C),
          secondary50: const Color(0xFF181717),
          secondary100: const Color(0xFF272626),
          secondary200: const Color(0xFF3F4040),
          secondary300: const Color(0xFF515252),
          secondary400: const Color(0xFF5E5F5F),
          secondary500: const Color(0xFF727373),
          secondary600: const Color(0xFFAFB0B0),
          secondary700: const Color(0xFFDBDBDB),
          secondary800: const Color(0xFFE7E8E8),
          secondary900: const Color(0xFFF1F2F2),
          secondary950: const Color(0xFFFEFFFF),
        );
      case GSThemes.red:
        return GSThemeData(
          theme: GSThemes.red,
          // Red theme colors
          primary0: Colors.red[900],
          primary50: Colors.red[800],
          primary100: Colors.red[700],
          primary200: Colors.red[600],
          primary300: Colors.red[500],
          primary400: Colors.red[400],
          primary500: Colors.red[300],
          primary600: Colors.red[200],
          primary700: Colors.red[100],
          primary800: Colors.red[50],
          primary900: Colors.red[50],
          primary950: Colors.red[50],
          secondary0: Colors.green[900],
          secondary50: Colors.green[800],
          secondary100: Colors.green[700],
          secondary200: Colors.green[600],
          secondary300: Colors.green[500],
          secondary400: Colors.green[400],
          secondary500: Colors.green[300],
          secondary600: Colors.green[200],
          secondary700: Colors.green[100],
          secondary800: Colors.green[50],
          secondary900: Colors.green[50],
          secondary950: Colors.green[50],
        );
      case GSThemes.blue:
        return GSThemeData(
          theme: GSThemes.blue,
          // Blue theme colors
          primary0: Colors.blue[900],
          primary50: Colors.blue[800],
          primary100: Colors.blue[700],
          primary200: Colors.blue[600],
          primary300: Colors.blue[500],
          primary400: Colors.blue[400],
          primary500: Colors.blue[300],
          primary600: Colors.blue[200],
          primary700: Colors.blue[100],
          primary800: Colors.blue[50],
          primary900: Colors.blue[50],
          primary950: Colors.blue[50],
          secondary0: Colors.green[900],
          secondary50: Colors.green[800],
          secondary100: Colors.green[700],
          secondary200: Colors.green[600],
          secondary300: Colors.green[500],
          secondary400: Colors.green[400],
          secondary500: Colors.green[300],
          secondary600: Colors.green[200],
          secondary700: Colors.green[100],
          secondary800: Colors.green[50],
          secondary900: Colors.green[50],
          secondary950: Colors.green[50],
        );
      case GSThemes.green:
        return GSThemeData(
          theme: GSThemes.green,
          // Green theme colors
          primary0: Colors.green[900],
          primary50: Colors.green[800],
          primary100: Colors.green[700],
          primary200: Colors.green[600],
          primary300: Colors.green[500],
          primary400: Colors.green[400],
          primary500: Colors.green[300],
          primary600: Colors.green[200],
          primary700: Colors.green[100],
          primary800: Colors.green[50],
          primary900: Colors.green[50],
          primary950: Colors.green[50],
          secondary0: Colors.red[900],
          secondary50: Colors.red[800],
          secondary100: Colors.red[700],
          secondary200: Colors.red[600],
          secondary300: Colors.red[500],
          secondary400: Colors.red[400],
          secondary500: Colors.red[300],
          secondary600: Colors.red[200],
          secondary700: Colors.red[100],
          secondary800: Colors.red[50],
          secondary900: Colors.red[50],
          secondary950: Colors.red[50],
        );
      default:
        //else - light mode

        return GSThemeData(
          theme: GSThemes.light,
          primary0: const Color(0xFFB3B3B3),
          primary50: const Color(0xFF999999),
          primary100: const Color(0xFF808080),
          primary200: const Color(0xFF737373),
          primary300: const Color(0xFF666666),
          primary400: const Color(0xFF525252),
          primary500: const Color(0xFF333333),
          primary600: const Color(0xFF292929),
          primary700: const Color(0xFF1F1F1F),
          primary800: const Color(0xFF0D0D0D),
          primary900: const Color(0xFF0A0A0A),
          primary950: const Color(0xFF080808),
          secondary0: const Color(0xFFFEFFFF),
          secondary50: const Color(0xFFF1F2F2),
          secondary100: const Color(0xFFE7E8E8),
          secondary200: const Color(0xFFDBDBDB),
          secondary300: const Color(0xFFAFB0B0),
          secondary400: const Color(0xFF727373),
          secondary500: const Color(0xFF5E5F5F),
          secondary600: const Color(0xFF515252),
          secondary700: const Color(0xFF3F4040),
          secondary800: const Color(0xFF272626),
          secondary900: const Color(0xFF181717),
          secondary950: const Color(0xFF0B0C0C),
        );
    }
  }
}


Map themeColorMap({required BuildContext context}) {
  final mapp = {
    'transparent': const Color.fromARGB(0, 0, 0, 0),
    'white': const Color(0xffffffff),
    'black': const Color(0xff000000),
    'primary0': GSTheme.of(context).primary0,
    'primary50': GSTheme.of(context).primary50,
    'primary100': GSTheme.of(context).primary100,
    'primary200': GSTheme.of(context).primary200,
    'primary300': GSTheme.of(context).primary300,
    'primary400': GSTheme.of(context).primary400,
    'primary500': GSTheme.of(context).primary500,
    'primary600': GSTheme.of(context).primary600,
    'primary700': GSTheme.of(context).primary700,
    'primary800': GSTheme.of(context).primary800,
    'primary900': GSTheme.of(context).primary900,
    'primary950': GSTheme.of(context).primary950,
    'secondary0': GSTheme.of(context).secondary0,
    'secondary50': GSTheme.of(context).secondary50,
    'secondary100': GSTheme.of(context).secondary100,
    'secondary200': GSTheme.of(context).secondary200,
    'secondary300': GSTheme.of(context).secondary300,
    'secondary400': GSTheme.of(context).secondary400,
    'secondary500': GSTheme.of(context).secondary500,
    'secondary600': GSTheme.of(context).secondary600,
    'secondary700': GSTheme.of(context).secondary700,
    'secondary800': GSTheme.of(context).secondary800,
    'secondary900': GSTheme.of(context).secondary900,
    'secondary950': GSTheme.of(context).secondary950,
  };
  return mapp;
}
