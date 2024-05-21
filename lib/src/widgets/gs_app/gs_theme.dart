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
class GSThemeData {
  String? themeId;
  //primary
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
  Color? error00;
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
  Color? border0;
  Color? border50;
  Color? border100;
  Color? border200;
  Color? border300;
  Color? border400;
  Color? border500;
  Color? border600;
  Color? border700;
  Color? border800;
  Color? border900;
  Color? border950;
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
  Color? backgroundError;
  Color? backgroundWarning;
  Color? backgroundSuccess;
  Color? backgroundMuted;
  Color? backgroundInfo;
  Color? white;
  Color? black;
  Color? rose50;
  Color? rose100;
  Color? rose200;
  Color? rose300;
  Color? rose400;
  Color? rose500;
  Color? rose600;
  Color? rose700;
  Color? rose800;
  Color? rose900;
  Color? pink50;
  Color? pink100;
  Color? pink200;
  Color? pink300;
  Color? pink400;
  Color? pink500;
  Color? pink600;
  Color? pink700;
  Color? pink800;
  Color? pink900;
  Color? fuchsia50;
  Color? fuchsia100;
  Color? fuchsia200;
  Color? fuchsia300;
  Color? fuchsia400;
  Color? fuchsia500;
  Color? fuchsia600;
  Color? fuchsia700;
  Color? fuchsia800;
  Color? fuchsia900;
  Color? purple50;
  Color? purple100;
  Color? purple200;
  Color? purple300;
  Color? purple400;
  Color? purple500;
  Color? purple600;
  Color? purple700;
  Color? purple800;
  Color? purple900;
  Color? violet50;
  Color? violet100;
  Color? violet200;
  Color? violet300;
  Color? violet400;
  Color? violet500;
  Color? violet600;
  Color? violet700;
  Color? violet800;
  Color? violet900;
  Color? indigo50;
  Color? indigo100;
  Color? indigo200;
  Color? indigo300;
  Color? indigo400;
  Color? indigo500;
  Color? indigo600;
  Color? indigo700;
  Color? indigo800;
  Color? indigo900;
  Color? blue50;
  Color? blue100;
  Color? blue200;
  Color? blue300;
  Color? blue400;
  Color? blue500;
  Color? blue600;
  Color? blue700;
  Color? blue800;
  Color? blue900;
  Color? lightBlue50;
  Color? lightBlue100;
  Color? lightBlue200;
  Color? lightBlue300;
  Color? lightBlue400;
  Color? lightBlue500;
  Color? lightBlue600;
  Color? lightBlue700;
  Color? lightBlue800;
  Color? lightBlue900;
  Color? darkBlue50;
  Color? darkBlue100;
  Color? darkBlue200;
  Color? darkBlue300;
  Color? darkBlue400;
  Color? darkBlue500;
  Color? darkBlue600;
  Color? darkBlue700;
  Color? darkBlue800;
  Color? darkBlue900;
  Color? cyan50;
  Color? cyan100;
  Color? cyan200;
  Color? cyan300;
  Color? cyan400;
  Color? cyan500;
  Color? cyan600;
  Color? cyan700;
  Color? cyan800;
  Color? cyan900;
  Color? teal50;
  Color? teal100;
  Color? teal200;
  Color? teal300;
  Color? teal400;
  Color? teal500;
  Color? teal600;
  Color? teal700;
  Color? teal800;
  Color? teal900;
  Color? emerald50;
  Color? emerald100;
  Color? emerald200;
  Color? emerald300;
  Color? emerald400;
  Color? emerald500;
  Color? emerald600;
  Color? emerald700;
  Color? emerald800;
  Color? emerald900;
  Color? green50;
  Color? green100;
  Color? green200;
  Color? green300;
  Color? green400;
  Color? green500;
  Color? green600;
  Color? green700;
  Color? green800;
  Color? green900;
  Color? lime50;
  Color? lime100;
  Color? lime200;
  Color? lime300;
  Color? lime400;
  Color? lime500;
  Color? lime600;
  Color? lime700;
  Color? lime800;
  Color? lime900;
  Color? yellow50;
  Color? yellow100;
  Color? yellow200;
  Color? yellow300;
  Color? yellow400;
  Color? yellow500;
  Color? yellow600;
  Color? yellow700;
  Color? yellow800;
  Color? yellow900;
  Color? amber50;
  Color? amber100;
  Color? amber200;
  Color? amber300;
  Color? amber400;
  Color? amber500;
  Color? amber600;
  Color? amber700;
  Color? amber800;
  Color? amber900;
  Color? orange50;
  Color? orange100;
  Color? orange200;
  Color? orange300;
  Color? orange400;
  Color? orange500;
  Color? orange600;
  Color? orange700;
  Color? orange800;
  Color? orange900;
  Color? red50;
  Color? red100;
  Color? red200;
  Color? red300;
  Color? red400;
  Color? red500;
  Color? red600;
  Color? red700;
  Color? red800;
  Color? red900;
  Color? warmGray50;
  Color? warmGray100;
  Color? warmGray200;
  Color? warmGray300;
  Color? warmGray400;
  Color? warmGray500;
  Color? warmGray600;
  Color? warmGray700;
  Color? warmGray800;
  Color? warmGray900;
  Color? trueGray50;
  Color? trueGray100;
  Color? trueGray200;
  Color? trueGray300;
  Color? trueGray400;
  Color? trueGray500;
  Color? trueGray600;
  Color? trueGray700;
  Color? trueGray800;
  Color? trueGray900;
  Color? coolGray50;
  Color? coolGray100;
  Color? coolGray200;
  Color? coolGray300;
  Color? coolGray400;
  Color? coolGray500;
  Color? coolGray600;
  Color? coolGray700;
  Color? coolGray800;
  Color? coolGray900;
  Color? blueGray50;
  Color? blueGray100;
  Color? blueGray200;
  Color? blueGray300;
  Color? blueGray400;
  Color? blueGray500;
  Color? blueGray600;
  Color? blueGray700;
  Color? blueGray800;
  Color? blueGray900;
  GSThemeData({
    this.themeId,
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
    this.error00,
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
    this.border0,
    this.border50,
    this.border100,
    this.border200,
    this.border300,
    this.border400,
    this.border500,
    this.border600,
    this.border700,
    this.border800,
    this.border900,
    this.border950,
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
    this.backgroundError,
    this.backgroundWarning,
    this.backgroundSuccess,
    this.backgroundMuted,
    this.backgroundInfo,
    this.white,
    this.black,
    this.rose50,
    this.rose100,
    this.rose200,
    this.rose300,
    this.rose400,
    this.rose500,
    this.rose600,
    this.rose700,
    this.rose800,
    this.rose900,
    this.pink50,
    this.pink100,
    this.pink200,
    this.pink300,
    this.pink400,
    this.pink500,
    this.pink600,
    this.pink700,
    this.pink800,
    this.pink900,
    this.fuchsia50,
    this.fuchsia100,
    this.fuchsia200,
    this.fuchsia300,
    this.fuchsia400,
    this.fuchsia500,
    this.fuchsia600,
    this.fuchsia700,
    this.fuchsia800,
    this.fuchsia900,
    this.purple50,
    this.purple100,
    this.purple200,
    this.purple300,
    this.purple400,
    this.purple500,
    this.purple600,
    this.purple700,
    this.purple800,
    this.purple900,
    this.violet50,
    this.violet100,
    this.violet200,
    this.violet300,
    this.violet400,
    this.violet500,
    this.violet600,
    this.violet700,
    this.violet800,
    this.violet900,
    this.indigo50,
    this.indigo100,
    this.indigo200,
    this.indigo300,
    this.indigo400,
    this.indigo500,
    this.indigo600,
    this.indigo700,
    this.indigo800,
    this.indigo900,
    this.blue50,
    this.blue100,
    this.blue200,
    this.blue300,
    this.blue400,
    this.blue500,
    this.blue600,
    this.blue700,
    this.blue800,
    this.blue900,
    this.lightBlue50,
    this.lightBlue100,
    this.lightBlue200,
    this.lightBlue300,
    this.lightBlue400,
    this.lightBlue500,
    this.lightBlue600,
    this.lightBlue700,
    this.lightBlue800,
    this.lightBlue900,
    this.darkBlue50,
    this.darkBlue100,
    this.darkBlue200,
    this.darkBlue300,
    this.darkBlue400,
    this.darkBlue500,
    this.darkBlue600,
    this.darkBlue700,
    this.darkBlue800,
    this.darkBlue900,
    this.cyan50,
    this.cyan100,
    this.cyan200,
    this.cyan300,
    this.cyan400,
    this.cyan500,
    this.cyan600,
    this.cyan700,
    this.cyan800,
    this.cyan900,
    this.teal50,
    this.teal100,
    this.teal200,
    this.teal300,
    this.teal400,
    this.teal500,
    this.teal600,
    this.teal700,
    this.teal800,
    this.teal900,
    this.emerald50,
    this.emerald100,
    this.emerald200,
    this.emerald300,
    this.emerald400,
    this.emerald500,
    this.emerald600,
    this.emerald700,
    this.emerald800,
    this.emerald900,
    this.green50,
    this.green100,
    this.green200,
    this.green300,
    this.green400,
    this.green500,
    this.green600,
    this.green700,
    this.green800,
    this.green900,
    this.lime50,
    this.lime100,
    this.lime200,
    this.lime300,
    this.lime400,
    this.lime500,
    this.lime600,
    this.lime700,
    this.lime800,
    this.lime900,
    this.yellow50,
    this.yellow100,
    this.yellow200,
    this.yellow300,
    this.yellow400,
    this.yellow500,
    this.yellow600,
    this.yellow700,
    this.yellow800,
    this.yellow900,
    this.amber50,
    this.amber100,
    this.amber200,
    this.amber300,
    this.amber400,
    this.amber500,
    this.amber600,
    this.amber700,
    this.amber800,
    this.amber900,
    this.orange50,
    this.orange100,
    this.orange200,
    this.orange300,
    this.orange400,
    this.orange500,
    this.orange600,
    this.orange700,
    this.orange800,
    this.orange900,
    this.red50,
    this.red100,
    this.red200,
    this.red300,
    this.red400,
    this.red500,
    this.red600,
    this.red700,
    this.red800,
    this.red900,
    this.warmGray50,
    this.warmGray100,
    this.warmGray200,
    this.warmGray300,
    this.warmGray400,
    this.warmGray500,
    this.warmGray600,
    this.warmGray700,
    this.warmGray800,
    this.warmGray900,
    this.trueGray50,
    this.trueGray100,
    this.trueGray200,
    this.trueGray300,
    this.trueGray400,
    this.trueGray500,
    this.trueGray600,
    this.trueGray700,
    this.trueGray800,
    this.trueGray900,
    this.coolGray50,
    this.coolGray100,
    this.coolGray200,
    this.coolGray300,
    this.coolGray400,
    this.coolGray500,
    this.coolGray600,
    this.coolGray700,
    this.coolGray800,
    this.coolGray900,
    this.blueGray50,
    this.blueGray100,
    this.blueGray200,
    this.blueGray300,
    this.blueGray400,
    this.blueGray500,
    this.blueGray600,
    this.blueGray700,
    this.blueGray800,
    this.blueGray900,
  });

  factory GSThemeData.fromTheme(String themeId) {
    late Map<String, dynamic> themeColorMap;

    if (!gSThemes.keys.contains(themeId)) {
      assert(false,
          "Theme not found... Ensure that theme name is present in gsThemeToken!");
    }

//Incase user forgets to enter some colors, use light theme as base
    if (themeId != 'light_theme') {
      //overwrite white theme with current theme
      themeColorMap = {
        ...gSThemes['light_theme']['colors'],
        ...gSThemes[themeId]['colors']
      };
    } else {
      themeColorMap = gSThemes['light_theme']['colors'];
    }

    Color getColor<T>(T colorHex) {
      if (colorHex is String) {
        final color = "0xff${colorHex.substring(1)}";
        return Color(
            int.tryParse(color) ?? 0x00000000); //default is transparent color
      } else if (colorHex is Color) {
        return colorHex;
      } else {
        //default is transparent color
        return const Color(0x00000000);
      }
    }

    // print(
    //     "p700 from factory: $themeId | ${themeColorMap['primary700']} | ${getColor(themeColorMap['primary700'])}");

    return GSThemeData(
        themeId: themeId,
        primary0: getColor(themeColorMap['primary0']),
        primary50: getColor(themeColorMap['primary50']),
        primary100: getColor(themeColorMap['primary100']),
        primary200: getColor(themeColorMap['primary200']),
        primary300: getColor(themeColorMap['primary300']),
        primary400: getColor(themeColorMap['primary400']),
        primary500: getColor(themeColorMap['primary500']),
        primary600: getColor(themeColorMap['primary600']),
        primary700: getColor(themeColorMap['primary700']),
        primary800: getColor(themeColorMap['primary800']),
        primary900: getColor(themeColorMap['primary900']),
        primary950: getColor(themeColorMap['primary950']),
        secondary0: getColor(themeColorMap['secondary0']),
        secondary50: getColor(themeColorMap['secondary50']),
        secondary100: getColor(themeColorMap['secondary100']),
        secondary200: getColor(themeColorMap['secondary200']),
        secondary300: getColor(themeColorMap['secondary300']),
        secondary400: getColor(themeColorMap['secondary400']),
        secondary500: getColor(themeColorMap['secondary500']),
        secondary600: getColor(themeColorMap['secondary600']),
        secondary700: getColor(themeColorMap['secondary700']),
        secondary800: getColor(themeColorMap['secondary800']),
        secondary900: getColor(themeColorMap['secondary900']),
        secondary950: getColor(themeColorMap['secondary950']),
        tertiary0: getColor(themeColorMap['tertiary0']),
        tertiary50: getColor(themeColorMap['tertiary50']),
        tertiary100: getColor(themeColorMap['tertiary100']),
        tertiary200: getColor(themeColorMap['tertiary200']),
        tertiary300: getColor(themeColorMap['tertiary300']),
        tertiary400: getColor(themeColorMap['tertiary400']),
        tertiary500: getColor(themeColorMap['tertiary500']),
        tertiary600: getColor(themeColorMap['tertiary600']),
        tertiary700: getColor(themeColorMap['tertiary700']),
        tertiary800: getColor(themeColorMap['tertiary800']),
        tertiary900: getColor(themeColorMap['tertiary900']),
        tertiary950: getColor(themeColorMap['tertiary950']),
        error00: getColor(themeColorMap['error00']),
        error50: getColor(themeColorMap['error50']),
        error100: getColor(themeColorMap['error100']),
        error200: getColor(themeColorMap['error200']),
        error300: getColor(themeColorMap['error300']),
        error400: getColor(themeColorMap['error400']),
        error500: getColor(themeColorMap['error500']),
        error600: getColor(themeColorMap['error600']),
        error700: getColor(themeColorMap['error700']),
        error800: getColor(themeColorMap['error800']),
        error900: getColor(themeColorMap['error900']),
        error950: getColor(themeColorMap['error950']),
        success0: getColor(themeColorMap['success0']),
        success50: getColor(themeColorMap['success50']),
        success100: getColor(themeColorMap['success100']),
        success200: getColor(themeColorMap['success200']),
        success300: getColor(themeColorMap['success300']),
        success400: getColor(themeColorMap['success400']),
        success500: getColor(themeColorMap['success500']),
        success600: getColor(themeColorMap['success600']),
        success700: getColor(themeColorMap['success700']),
        success800: getColor(themeColorMap['success800']),
        success900: getColor(themeColorMap['success900']),
        success950: getColor(themeColorMap['success950']),
        warning0: getColor(themeColorMap['warning0']),
        warning50: getColor(themeColorMap['warning50']),
        warning100: getColor(themeColorMap['warning100']),
        warning200: getColor(themeColorMap['warning200']),
        warning300: getColor(themeColorMap['warning300']),
        warning400: getColor(themeColorMap['warning400']),
        warning500: getColor(themeColorMap['warning500']),
        warning600: getColor(themeColorMap['warning600']),
        warning700: getColor(themeColorMap['warning700']),
        warning800: getColor(themeColorMap['warning800']),
        warning900: getColor(themeColorMap['warning900']),
        warning950: getColor(themeColorMap['warning950']),
        info0: getColor(themeColorMap['info0']),
        info50: getColor(themeColorMap['info50']),
        info100: getColor(themeColorMap['info100']),
        info200: getColor(themeColorMap['info200']),
        info300: getColor(themeColorMap['info300']),
        info400: getColor(themeColorMap['info400']),
        info500: getColor(themeColorMap['info500']),
        info600: getColor(themeColorMap['info600']),
        info700: getColor(themeColorMap['info700']),
        info800: getColor(themeColorMap['info800']),
        info900: getColor(themeColorMap['info900']),
        info950: getColor(themeColorMap['info950']),
        text0: getColor(themeColorMap['text0']),
        text50: getColor(themeColorMap['text50']),
        text100: getColor(themeColorMap['text100']),
        text200: getColor(themeColorMap['text200']),
        text300: getColor(themeColorMap['text300']),
        text400: getColor(themeColorMap['text400']),
        text500: getColor(themeColorMap['text500']),
        text600: getColor(themeColorMap['text600']),
        text700: getColor(themeColorMap['text700']),
        text800: getColor(themeColorMap['text800']),
        text900: getColor(themeColorMap['text900']),
        text950: getColor(themeColorMap['text950']),
        border0: getColor(themeColorMap['border0']),
        border50: getColor(themeColorMap['border50']),
        border100: getColor(themeColorMap['border100']),
        border200: getColor(themeColorMap['border200']),
        border300: getColor(themeColorMap['border300']),
        border400: getColor(themeColorMap['border400']),
        border500: getColor(themeColorMap['border500']),
        border600: getColor(themeColorMap['border600']),
        border700: getColor(themeColorMap['border700']),
        border800: getColor(themeColorMap['border800']),
        border900: getColor(themeColorMap['border900']),
        border950: getColor(themeColorMap['border950']),
        background0: getColor(themeColorMap['background0']),
        background50: getColor(themeColorMap['background50']),
        background100: getColor(themeColorMap['background100']),
        background200: getColor(themeColorMap['background200']),
        background300: getColor(themeColorMap['background300']),
        background400: getColor(themeColorMap['background400']),
        background500: getColor(themeColorMap['background500']),
        background600: getColor(themeColorMap['background600']),
        background700: getColor(themeColorMap['background700']),
        background800: getColor(themeColorMap['background800']),
        background900: getColor(themeColorMap['background900']),
        background950: getColor(themeColorMap['background950']),
        backgroundError: getColor(themeColorMap['backgroundError']),
        backgroundWarning: getColor(themeColorMap['backgroundWarning']),
        backgroundSuccess: getColor(themeColorMap['backgroundSuccess']),
        backgroundMuted: getColor(themeColorMap['backgroundMuted']),
        backgroundInfo: getColor(themeColorMap['backgroundInfo']),
        white: getColor(themeColorMap['white']),
        black: getColor(themeColorMap['black']),
        rose50: getColor(themeColorMap['rose50']),
        rose100: getColor(themeColorMap['rose100']),
        rose200: getColor(themeColorMap['rose200']),
        rose300: getColor(themeColorMap['rose300']),
        rose400: getColor(themeColorMap['rose400']),
        rose500: getColor(themeColorMap['rose500']),
        rose600: getColor(themeColorMap['rose600']),
        rose700: getColor(themeColorMap['rose700']),
        rose800: getColor(themeColorMap['rose800']),
        rose900: getColor(themeColorMap['rose900']),
        pink50: getColor(themeColorMap['pink50']),
        pink100: getColor(themeColorMap['pink100']),
        pink200: getColor(themeColorMap['pink200']),
        pink300: getColor(themeColorMap['pink300']),
        pink400: getColor(themeColorMap['pink400']),
        pink500: getColor(themeColorMap['pink500']),
        pink600: getColor(themeColorMap['pink600']),
        pink700: getColor(themeColorMap['pink700']),
        pink800: getColor(themeColorMap['pink800']),
        pink900: getColor(themeColorMap['pink900']),
        fuchsia50: getColor(themeColorMap['fuchsia50']),
        fuchsia100: getColor(themeColorMap['fuchsia100']),
        fuchsia200: getColor(themeColorMap['fuchsia200']),
        fuchsia300: getColor(themeColorMap['fuchsia300']),
        fuchsia400: getColor(themeColorMap['fuchsia400']),
        fuchsia500: getColor(themeColorMap['fuchsia500']),
        fuchsia600: getColor(themeColorMap['fuchsia600']),
        fuchsia700: getColor(themeColorMap['fuchsia700']),
        fuchsia800: getColor(themeColorMap['fuchsia800']),
        fuchsia900: getColor(themeColorMap['fuchsia900']),
        purple50: getColor(themeColorMap['purple50']),
        purple100: getColor(themeColorMap['purple100']),
        purple200: getColor(themeColorMap['purple200']),
        purple300: getColor(themeColorMap['purple300']),
        purple400: getColor(themeColorMap['purple400']),
        purple500: getColor(themeColorMap['purple500']),
        purple600: getColor(themeColorMap['purple600']),
        purple700: getColor(themeColorMap['purple700']),
        purple800: getColor(themeColorMap['purple800']),
        purple900: getColor(themeColorMap['purple900']),
        violet50: getColor(themeColorMap['violet50']),
        violet100: getColor(themeColorMap['violet100']),
        violet200: getColor(themeColorMap['violet200']),
        violet300: getColor(themeColorMap['violet300']),
        violet400: getColor(themeColorMap['violet400']),
        violet500: getColor(themeColorMap['violet500']),
        violet600: getColor(themeColorMap['violet600']),
        violet700: getColor(themeColorMap['violet700']),
        violet800: getColor(themeColorMap['violet800']),
        violet900: getColor(themeColorMap['violet900']),
        indigo50: getColor(themeColorMap['indigo50']),
        indigo100: getColor(themeColorMap['indigo100']),
        indigo200: getColor(themeColorMap['indigo200']),
        indigo300: getColor(themeColorMap['indigo300']),
        indigo400: getColor(themeColorMap['indigo400']),
        indigo500: getColor(themeColorMap['indigo500']),
        indigo600: getColor(themeColorMap['indigo600']),
        indigo700: getColor(themeColorMap['indigo700']),
        indigo800: getColor(themeColorMap['indigo800']),
        indigo900: getColor(themeColorMap['indigo900']),
        blue50: getColor(themeColorMap['blue50']),
        blue100: getColor(themeColorMap['blue100']),
        blue200: getColor(themeColorMap['blue200']),
        blue300: getColor(themeColorMap['blue300']),
        blue400: getColor(themeColorMap['blue400']),
        blue500: getColor(themeColorMap['blue500']),
        blue600: getColor(themeColorMap['blue600']),
        blue700: getColor(themeColorMap['blue700']),
        blue800: getColor(themeColorMap['blue800']),
        blue900: getColor(themeColorMap['blue900']),
        lightBlue50: getColor(themeColorMap['lightBlue50']),
        lightBlue100: getColor(themeColorMap['lightBlue100']),
        lightBlue200: getColor(themeColorMap['lightBlue200']),
        lightBlue300: getColor(themeColorMap['lightBlue300']),
        lightBlue400: getColor(themeColorMap['lightBlue400']),
        lightBlue500: getColor(themeColorMap['lightBlue500']),
        lightBlue600: getColor(themeColorMap['lightBlue600']),
        lightBlue700: getColor(themeColorMap['lightBlue700']),
        lightBlue800: getColor(themeColorMap['lightBlue800']),
        lightBlue900: getColor(themeColorMap['lightBlue900']),
        darkBlue50: getColor(themeColorMap['darkBlue50']),
        darkBlue100: getColor(themeColorMap['darkBlue100']),
        darkBlue200: getColor(themeColorMap['darkBlue200']),
        darkBlue300: getColor(themeColorMap['darkBlue300']),
        darkBlue400: getColor(themeColorMap['darkBlue400']),
        darkBlue500: getColor(themeColorMap['darkBlue500']),
        darkBlue600: getColor(themeColorMap['darkBlue600']),
        darkBlue700: getColor(themeColorMap['darkBlue700']),
        darkBlue800: getColor(themeColorMap['darkBlue800']),
        darkBlue900: getColor(themeColorMap['darkBlue900']),
        cyan50: getColor(themeColorMap['cyan50']),
        cyan100: getColor(themeColorMap['cyan100']),
        cyan200: getColor(themeColorMap['cyan200']),
        cyan300: getColor(themeColorMap['cyan300']),
        cyan400: getColor(themeColorMap['cyan400']),
        cyan500: getColor(themeColorMap['cyan500']),
        cyan600: getColor(themeColorMap['cyan600']),
        cyan700: getColor(themeColorMap['cyan700']),
        cyan800: getColor(themeColorMap['cyan800']),
        cyan900: getColor(themeColorMap['cyan900']),
        teal50: getColor(themeColorMap['teal50']),
        teal100: getColor(themeColorMap['teal100']),
        teal200: getColor(themeColorMap['teal200']),
        teal300: getColor(themeColorMap['teal300']),
        teal400: getColor(themeColorMap['teal400']),
        teal500: getColor(themeColorMap['teal500']),
        teal600: getColor(themeColorMap['teal600']),
        teal700: getColor(themeColorMap['teal700']),
        teal800: getColor(themeColorMap['teal800']),
        teal900: getColor(themeColorMap['teal900']),
        emerald50: getColor(themeColorMap['emerald50']),
        emerald100: getColor(themeColorMap['emerald100']),
        emerald200: getColor(themeColorMap['emerald200']),
        emerald300: getColor(themeColorMap['emerald300']),
        emerald400: getColor(themeColorMap['emerald400']),
        emerald500: getColor(themeColorMap['emerald500']),
        emerald600: getColor(themeColorMap['emerald600']),
        emerald700: getColor(themeColorMap['emerald700']),
        emerald800: getColor(themeColorMap['emerald800']),
        emerald900: getColor(themeColorMap['emerald900']),
        green50: getColor(themeColorMap['green50']),
        green100: getColor(themeColorMap['green100']),
        green200: getColor(themeColorMap['green200']),
        green300: getColor(themeColorMap['green300']),
        green400: getColor(themeColorMap['green400']),
        green500: getColor(themeColorMap['green500']),
        green600: getColor(themeColorMap['green600']),
        green700: getColor(themeColorMap['green700']),
        green800: getColor(themeColorMap['green800']),
        green900: getColor(themeColorMap['green900']),
        lime50: getColor(themeColorMap['lime50']),
        lime100: getColor(themeColorMap['lime100']),
        lime200: getColor(themeColorMap['lime200']),
        lime300: getColor(themeColorMap['lime300']),
        lime400: getColor(themeColorMap['lime400']),
        lime500: getColor(themeColorMap['lime500']),
        lime600: getColor(themeColorMap['lime600']),
        lime700: getColor(themeColorMap['lime700']),
        lime800: getColor(themeColorMap['lime800']),
        lime900: getColor(themeColorMap['lime900']),
        yellow50: getColor(themeColorMap['yellow50']),
        yellow100: getColor(themeColorMap['yellow100']),
        yellow200: getColor(themeColorMap['yellow200']),
        yellow300: getColor(themeColorMap['yellow300']),
        yellow400: getColor(themeColorMap['yellow400']),
        yellow500: getColor(themeColorMap['yellow500']),
        yellow600: getColor(themeColorMap['yellow600']),
        yellow700: getColor(themeColorMap['yellow700']),
        yellow800: getColor(themeColorMap['yellow800']),
        yellow900: getColor(themeColorMap['yellow900']),
        amber50: getColor(themeColorMap['amber50']),
        amber100: getColor(themeColorMap['amber100']),
        amber200: getColor(themeColorMap['amber200']),
        amber300: getColor(themeColorMap['amber300']),
        amber400: getColor(themeColorMap['amber400']),
        amber500: getColor(themeColorMap['amber500']),
        amber600: getColor(themeColorMap['amber600']),
        amber700: getColor(themeColorMap['amber700']),
        amber800: getColor(themeColorMap['amber800']),
        amber900: getColor(themeColorMap['amber900']),
        orange50: getColor(themeColorMap['orange50']),
        orange100: getColor(themeColorMap['orange100']),
        orange200: getColor(themeColorMap['orange200']),
        orange300: getColor(themeColorMap['orange300']),
        orange400: getColor(themeColorMap['orange400']),
        orange500: getColor(themeColorMap['orange500']),
        orange600: getColor(themeColorMap['orange600']),
        orange700: getColor(themeColorMap['orange700']),
        orange800: getColor(themeColorMap['orange800']),
        orange900: getColor(themeColorMap['orange900']),
        red50: getColor(themeColorMap['red50']),
        red100: getColor(themeColorMap['red100']),
        red200: getColor(themeColorMap['red200']),
        red300: getColor(themeColorMap['red300']),
        red400: getColor(themeColorMap['red400']),
        red500: getColor(themeColorMap['red500']),
        red600: getColor(themeColorMap['red600']),
        red700: getColor(themeColorMap['red700']),
        red800: getColor(themeColorMap['red800']),
        red900: getColor(themeColorMap['red900']),
        warmGray50: getColor(themeColorMap['warmGray50']),
        warmGray100: getColor(themeColorMap['warmGray100']),
        warmGray200: getColor(themeColorMap['warmGray200']),
        warmGray300: getColor(themeColorMap['warmGray300']),
        warmGray400: getColor(themeColorMap['warmGray400']),
        warmGray500: getColor(themeColorMap['warmGray500']),
        warmGray600: getColor(themeColorMap['warmGray600']),
        warmGray700: getColor(themeColorMap['warmGray700']),
        warmGray800: getColor(themeColorMap['warmGray800']),
        warmGray900: getColor(themeColorMap['warmGray900']),
        trueGray50: getColor(themeColorMap['trueGray50']),
        trueGray100: getColor(themeColorMap['trueGray100']),
        trueGray200: getColor(themeColorMap['trueGray200']),
        trueGray300: getColor(themeColorMap['trueGray300']),
        trueGray400: getColor(themeColorMap['trueGray400']),
        trueGray500: getColor(themeColorMap['trueGray500']),
        trueGray600: getColor(themeColorMap['trueGray600']),
        trueGray700: getColor(themeColorMap['trueGray700']),
        trueGray800: getColor(themeColorMap['trueGray800']),
        trueGray900: getColor(themeColorMap['trueGray900']),
        coolGray50: getColor(themeColorMap['coolGray50']),
        coolGray100: getColor(themeColorMap['coolGray100']),
        coolGray200: getColor(themeColorMap['coolGray200']),
        coolGray300: getColor(themeColorMap['coolGray300']),
        coolGray400: getColor(themeColorMap['coolGray400']),
        coolGray500: getColor(themeColorMap['coolGray500']),
        coolGray600: getColor(themeColorMap['coolGray600']),
        coolGray700: getColor(themeColorMap['coolGray700']),
        coolGray800: getColor(themeColorMap['coolGray800']),
        coolGray900: getColor(themeColorMap['coolGray900']),
        blueGray50: getColor(themeColorMap['blueGray50']),
        blueGray100: getColor(themeColorMap['blueGray100']),
        blueGray200: getColor(themeColorMap['blueGray200']),
        blueGray300: getColor(themeColorMap['blueGray300']),
        blueGray400: getColor(themeColorMap['blueGray400']),
        blueGray500: getColor(themeColorMap['blueGray500']),
        blueGray600: getColor(themeColorMap['blueGray600']),
        blueGray700: getColor(themeColorMap['blueGray700']),
        blueGray800: getColor(themeColorMap['blueGray800']),
        blueGray900: getColor(themeColorMap['blueGray900']));
  }
}
