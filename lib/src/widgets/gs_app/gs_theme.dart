import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

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
  //secondary
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
  //tert
  Color? tertiary0;
  Color? tertiary50;
  Color? tertiary100;
  Color? tertiary200;
  Color? tertiary300;
  Color? tertiary400;
  Color? tertiary500;
  Color? tertiary600;
  Color? tertiary700;
  Color? tertiary800;
  Color? tertiary900;
  Color? tertiary950;
  //error
  Color? error0;
  Color? error50;
  Color? error100;
  Color? error200;
  Color? error300;
  Color? error400;
  Color? error500;
  Color? error600;
  Color? error700;
  Color? error800;
  Color? error900;
  Color? error950;
  //succ
  Color? success0;
  Color? success50;
  Color? success100;
  Color? success200;
  Color? success300;
  Color? success400;
  Color? success500;
  Color? success600;
  Color? success700;
  Color? success800;
  Color? success900;
  Color? success950;
  //warning
  Color? warning0;
  Color? warning50;
  Color? warning100;
  Color? warning200;
  Color? warning300;
  Color? warning400;
  Color? warning500;
  Color? warning600;
  Color? warning700;
  Color? warning800;
  Color? warning900;
  Color? warning950;
  //info
  Color? info0;
  Color? info50;
  Color? info100;
  Color? info200;
  Color? info300;
  Color? info400;
  Color? info500;
  Color? info600;
  Color? info700;
  Color? info800;
  Color? info900;
  Color? info950;
  //typo
  Color? text0;
  Color? text50;
  Color? text100;
  Color? text200;
  Color? text300;
  Color? text400;
  Color? text500;
  Color? text600;
  Color? text700;
  Color? text800;
  Color? text900;
  Color? text950;
  Color? textwhite;
  Color? textgray;
  Color? textblack;
  //outline
  Color? outline0;
  Color? outline50;
  Color? outline100;
  Color? outline200;
  Color? outline300;
  Color? outline400;
  Color? outline500;
  Color? outline600;
  Color? outline700;
  Color? outline800;
  Color? outline900;
  Color? outline950;
  //bg
  Color? background0;
  Color? background50;
  Color? background100;
  Color? background200;
  Color? background300;
  Color? background400;
  Color? background500;
  Color? background600;
  Color? background700;
  Color? background800;
  Color? background900;
  Color? background950;
  Color? backgrounderror;
  Color? backgroundwarning;
  Color? backgroundmuted;
  Color? backgroundsuccess;
  Color? backgroundinfo;
  Color? backgroundlight;
  Color? backgrounddark;
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
    this.tertiary0,
    this.tertiary50,
    this.tertiary100,
    this.tertiary200,
    this.tertiary300,
    this.tertiary400,
    this.tertiary500,
    this.tertiary600,
    this.tertiary700,
    this.tertiary800,
    this.tertiary900,
    this.tertiary950,
    this.error0,
    this.error50,
    this.error100,
    this.error200,
    this.error300,
    this.error400,
    this.error500,
    this.error600,
    this.error700,
    this.error800,
    this.error900,
    this.error950,
    this.success0,
    this.success50,
    this.success100,
    this.success200,
    this.success300,
    this.success400,
    this.success500,
    this.success600,
    this.success700,
    this.success800,
    this.success900,
    this.success950,
    this.warning0,
    this.warning50,
    this.warning100,
    this.warning200,
    this.warning300,
    this.warning400,
    this.warning500,
    this.warning600,
    this.warning700,
    this.warning800,
    this.warning900,
    this.warning950,
    this.info0,
    this.info50,
    this.info100,
    this.info200,
    this.info300,
    this.info400,
    this.info500,
    this.info600,
    this.info700,
    this.info800,
    this.info900,
    this.info950,
    this.text0,
    this.text50,
    this.text100,
    this.text200,
    this.text300,
    this.text400,
    this.text500,
    this.text600,
    this.text700,
    this.text800,
    this.text900,
    this.text950,
    this.textwhite,
    this.textgray,
    this.textblack,
    this.outline0,
    this.outline50,
    this.outline100,
    this.outline200,
    this.outline300,
    this.outline400,
    this.outline500,
    this.outline600,
    this.outline700,
    this.outline800,
    this.outline900,
    this.outline950,
    this.background0,
    this.background50,
    this.background100,
    this.background200,
    this.background300,
    this.background400,
    this.background500,
    this.background600,
    this.background700,
    this.background800,
    this.background900,
    this.background950,
    this.backgrounddark,
    this.backgrounderror,
    this.backgroundwarning,
    this.backgroundlight,
    this.backgroundinfo,
    this.backgroundmuted,
    this.backgroundsuccess,
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
          //sec
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

// Tertiary Colors
          tertiary0: const Color(0xFFFFF5F5),
          tertiary50: const Color(0xFFFFF2E5),
          tertiary100: const Color(0xFFFFEBD6),
          tertiary200: const Color(0xFFFED1AA),
          tertiary300: const Color(0xFFFDB474),
          tertiary400: const Color(0xFFFB9D4B),
          tertiary500: const Color(0xFFE78128),
          tertiary600: const Color(0xFFD7751F),
          tertiary700: const Color(0xFFB4621A),
          tertiary800: const Color(0xFF824917),
          tertiary900: const Color(0xFF6C3D13),
          tertiary950: const Color(0xFF543112),

// Error Colors
          error0: const Color(0xFFFEE9E9),
          error50: const Color(0xFFFEE2E2),
          error100: const Color(0xFFFECAAC),
          error200: const Color(0xFFFCA5A5),
          error300: const Color(0xFFF87171),
          error400: const Color(0xFFEF4444),
          error500: const Color(0xFFE63535),
          error600: const Color(0xFFDC2626),
          error700: const Color(0xFFB91C1C),
          error800: const Color(0xFF991B1B),
          error900: const Color(0xFF7F1D1D),
          error950: const Color(0xFF531313),

          //succ
          success0: const Color(0xFFE4FFF4),
          success50: const Color(0xFFCAFFEE),
          success100: const Color(0xFFA2F1C0),
          success200: const Color(0xFF84D3A2),
          success300: const Color(0xFF66B584),
          success400: const Color(0xFF489766),
          success500: const Color(0xFF348352),
          success600: const Color(0xFF2A7948),
          success700: const Color(0xFF206F3E),
          success800: const Color(0xFF165334),
          success900: const Color(0xFF14352D),
          success950: const Color(0xFF183224),

//warning
          warning0: const Color(0xFFFFFDFB),
          warning50: const Color(0xFFFFF9F5),
          warning100: const Color(0xFFFFE7D5),
          warning200: const Color(0xFFFECDAA),
          warning300: const Color(0xFFFDAD74),
          warning400: const Color(0xFFFB954B),
          warning500: const Color(0xFFE77828),
          warning600: const Color(0xFFD76C1F),
          warning700: const Color(0xFFB45A1A),
          warning800: const Color(0xFF824417),
          warning900: const Color(0xFF6C3813),
          warning950: const Color(0xFF542D12),

//info
          info0: const Color(0xFFECF8FE),
          info50: const Color(0xFFC7EBFC),
          info100: const Color(0xFFA2DFFA),
          info200: const Color(0xFF7CCFF8),
          info300: const Color(0xFF57C2F6),
          info400: const Color(0xFF32B4F4),
          info500: const Color(0xFF0DA6F2),
          info600: const Color(0xFF08BCD0),
          info700: const Color(0xFF0973A8),
          info800: const Color(0xFF075AB3),
          info900: const Color(0xFF05405D),
          info950: const Color(0xFF032638),

//text
          text0: const Color(0xFFFFFFFF),
          text50: const Color(0xFFF5F5F5),
          text100: const Color(0xFFE5E5E5),
          text200: const Color(0xFFDBDBDB),
          text300: const Color(0xFFD4D4D4),
          text400: const Color(0xFFA3A3A3),
          text500: const Color(0xFFB8C8C8),
          text600: const Color(0xFF737373),
          text700: const Color(0xFF525252),
          text800: const Color(0xFF404040),
          text900: const Color(0xFF262627),
          text950: const Color(0xFF171717),
          textwhite: const Color(0xffFFFFFF),
          textgray: const Color(0xffD4D4D4),
          textblack: const Color(0xff181718),

//outline
          outline0: const Color(0xffFDFEFE),
          outline50: const Color(0xffF3F3F3),
          outline100: const Color(0xffE6E6E6),
          outline200: const Color(0xffDDDCDB),
          outline300: const Color(0xffD3D3D3),
          outline400: const Color(0xffA5A3A3),
          outline500: const Color(0xff8C8D8D),
          outline600: const Color(0xff737474),
          outline700: const Color(0xff535252),
          outline800: const Color(0xff414141),
          outline900: const Color(0xff272624),
          outline950: const Color(0xff1A1717),
//bg
          background0: const Color(0xffFBFBFB),
          background50: const Color(0xffF6F6F6),
          background100: const Color(0xffF2F1F1),
          background200: const Color(0xffDCDBDB),
          background300: const Color(0xffD5D4D4),
          background400: const Color(0xffA2A3A3),
          background500: const Color(0xff8E8E8E),
          background600: const Color(0xff747474),
          background700: const Color(0xff535252),
          background800: const Color(0xff414040),
          background900: const Color(0xff272625),
          background950: const Color(0xff181718),
          backgroundsuccess: const Color(0xffEDFCF2),
          backgrounderror: const Color(0xffFEF1F1),
          backgroundmuted: const Color(0xffF6F6F7),
          backgroundinfo: const Color(0xffEBF8FE),
          backgroundwarning: const Color(0xffFFF4EB),
          backgrounddark: const Color(0xff181719),
          backgroundlight: const Color(0xffFBFBFB),
        );
    }
  }
}

Map themeColorMap(context) {
  final mapp = {
    ...$GSColors.colorMap,
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

    'tertiary0':   GSTheme.of(context).tertiary0,
    'tertiary50':  GSTheme.of(context).tertiary50,
    'tertiary100': GSTheme.of(context).tertiary100,
    'tertiary200': GSTheme.of(context).tertiary200,
    'tertiary300': GSTheme.of(context).tertiary300,
    'tertiary400': GSTheme.of(context).tertiary400,
    'tertiary500': GSTheme.of(context).tertiary500,
    'tertiary600': GSTheme.of(context).tertiary600,
    'tertiary700': GSTheme.of(context).tertiary700,
    'tertiary800': GSTheme.of(context).tertiary800,
    'tertiary900': GSTheme.of(context).tertiary900,
    'tertiary950': GSTheme.of(context).tertiary950,


    'error0':   GSTheme.of(context).error0,
    'error50':  GSTheme.of(context).error50,
    'error100': GSTheme.of(context).error100,
    'error200': GSTheme.of(context).error200,
    'error300': GSTheme.of(context).error300,
    'error400': GSTheme.of(context).error400,
    'error500': GSTheme.of(context).error500,
    'error600': GSTheme.of(context).error600,
    'error700': GSTheme.of(context).error700,
    'error800': GSTheme.of(context).error800,
    'error900': GSTheme.of(context).error900,
    'error950': GSTheme.of(context).error950,

    'success0':   GSTheme.of(context).success0,
    'success50':  GSTheme.of(context).success50,
    'success100': GSTheme.of(context).success100,
    'success200': GSTheme.of(context).success200,
    'success300': GSTheme.of(context).success300,
    'success400': GSTheme.of(context).success400,
    'success500': GSTheme.of(context).success500,
    'success600': GSTheme.of(context).success600,
    'success700': GSTheme.of(context).success700,
    'success800': GSTheme.of(context).success800,
    'success900': GSTheme.of(context).success900,
    'success950': GSTheme.of(context).success950,

    'warning0':   GSTheme.of(context).warning0,
    'warning50':  GSTheme.of(context).warning50,
    'warning100': GSTheme.of(context).warning100,
    'warning200': GSTheme.of(context).warning200,
    'warning300': GSTheme.of(context).warning300,
    'warning400': GSTheme.of(context).warning400,
    'warning500': GSTheme.of(context).warning500,
    'warning600': GSTheme.of(context).warning600,
    'warning700': GSTheme.of(context).warning700,
    'warning800': GSTheme.of(context).warning800,
    'warning900': GSTheme.of(context).warning900,
    'warning950': GSTheme.of(context).warning950,

    'info0':   GSTheme.of(context).info0,
    'info50':  GSTheme.of(context).info50,
    'info100': GSTheme.of(context).info100,
    'info200': GSTheme.of(context).info200,
    'info300': GSTheme.of(context).info300,
    'info400': GSTheme.of(context).info400,
    'info500': GSTheme.of(context).info500,
    'info600': GSTheme.of(context).info600,
    'info700': GSTheme.of(context).info700,
    'info800': GSTheme.of(context).info800,
    'info900': GSTheme.of(context).info900,
    'info950': GSTheme.of(context).info950,


    'text0':   GSTheme.of(context).text0,
    'text50':  GSTheme.of(context).text50,
    'text100': GSTheme.of(context).text100,
    'text200': GSTheme.of(context).text200,
    'text300': GSTheme.of(context).text300,
    'text400': GSTheme.of(context).text400,
    'text500': GSTheme.of(context).text500,
    'text600': GSTheme.of(context).text600,
    'text700': GSTheme.of(context).text700,
    'text800': GSTheme.of(context).text800,
    'text900': GSTheme.of(context).text900,
    'text950': GSTheme.of(context).text950,
    'textwhite': GSTheme.of(context).textwhite,
    'textblack': GSTheme.of(context).textblack,
    'textgray': GSTheme.of(context).textgray,

    'outline0':   GSTheme.of(context).outline0,
    'outline50':  GSTheme.of(context).outline50,
    'outline100': GSTheme.of(context).outline100,
    'outline200': GSTheme.of(context).outline200,
    'outline300': GSTheme.of(context).outline300,
    'outline400': GSTheme.of(context).outline400,
    'outline500': GSTheme.of(context).outline500,
    'outline600': GSTheme.of(context).outline600,
    'outline700': GSTheme.of(context).outline700,
    'outline800': GSTheme.of(context).outline800,
    'outline900': GSTheme.of(context).outline900,
    'outline950': GSTheme.of(context).outline950,

    'background0':   GSTheme.of(context).background0,
    'background50':  GSTheme.of(context).background50,
    'background100': GSTheme.of(context).background100,
    'background200': GSTheme.of(context).background200,
    'background300': GSTheme.of(context).background300,
    'background400': GSTheme.of(context).background400,
    'background500': GSTheme.of(context).background500,
    'background600': GSTheme.of(context).background600,
    'background700': GSTheme.of(context).background700,
    'background800': GSTheme.of(context).background800,
    'background900': GSTheme.of(context).background900,
    'background950': GSTheme.of(context).background950,

    'backgrounderror': GSTheme.of(context).backgrounderror,
    'backgroundwarning': GSTheme.of(context).backgroundwarning,
    'backgroundinfo': GSTheme.of(context).backgroundinfo,
    'backgroundmuted': GSTheme.of(context).backgroundmuted,
    'backgroundlight': GSTheme.of(context).backgroundlight,
    'backgrounddark': GSTheme.of(context).backgrounddark,
    'backgroundsuccess': GSTheme.of(context).backgroundsuccess,

  };

  return mapp;
}
