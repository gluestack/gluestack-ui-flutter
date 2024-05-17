import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
// import 'package:gluestack_ui_example/providers/theme_provider/theme_provider.dart';
import 'package:gluestack_ui_example/routes/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentTheme = 'light_theme';
  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      // // This is how we can provide custom configuration to Gluestack Theme.
      // gluestackCustomConfig: GluestackCustomConfig(
      //   button: customButton,
      //   buttonText: customButtonText,
      // ),
      // // This is how we can create color themes - primary & secondary swatches from just a base color
      // gluestackTokenConfig: GluestackTokenConfig(
      // gsFontFamilyToken:
      // const GSFontFamilyToken($body: 'Sono', $heading: 'Sono')
      // gsColorsToken: const GSColorsToken(
      //   primaryColorsFromBase: Color(0xFF00FF00),
      //   secondaryColorsFromBase: Color(0xFFFF0000),
      // ),
      // ),
      gluestackTokenConfig: GluestackTokenConfig(
        gsThemeToken: myTheme,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          return GSTheme(
            data: GSThemeData.fromTheme('light_theme'),
            child: GSApp.router(
              debugShowCheckedModeBanner: false,
              color: $GSColors.primary500,
              routerConfig: ree((String newTheme) {
                setState(() {
                  currentTheme = newTheme;
                });
              }),
              theme: GSThemeData.fromTheme(currentTheme),
            ),
          );
        },
      ),
    );
  }
}

const myTheme = {
  "cyan_theme": {
    "colors": {
      "primary0": Color(0xFFB2EBF2),
      "primary50": Color(0xFF80DEEA),
      "primary100": Color(0xFF4DD0E1),
      "primary200": Color(0xFF26C6DA),
      "primary300": Color(0xFF00BCD4),
      "primary400": Color(0xFF00ACC1),
      "primary500": Color(0xFF0097A7),
      "primary600": Color(0xFF00838F),
      "primary700": Color(0xFF006064),
      "primary800": Color(0xFF004D40),
      "primary900": Color(0xFF00332A),
      "primary950": Color(0xFF00251A),
      "secondary0": Color(0xFFB2EBF2),
      "secondary50": Color(0xFF80DEEA),
      "secondary100": Color(0xFF4DD0E1),
      "secondary200": Color(0xFF26C6DA),
      "secondary300": Color(0xFF00BCD4),
      "secondary400": Color(0xFF00ACC1),
      "secondary500": Color(0xFF0097A7),
      "secondary600": Color(0xFF00838F),
      "secondary700": Color(0xFF006064),
      "secondary800": Color(0xFF004D40),
      "secondary900": Color(0xFF00332A),
      "secondary950": Color(0xFF00251A),
      "tertiary0": Color(0xFF543112),
      "tertiary50": Color(0xFF6C3D13),
      "tertiary100": Color(0xFF824917),
      "tertiary200": Color(0xFFB4621A),
      "tertiary300": Color(0xFFD7751F),
      "tertiary400": Color(0xFFE78128),
      "tertiary500": Color(0xFFFB9D4B),
      "tertiary600": Color(0xFFFDB474),
      "tertiary700": Color(0xFFFED1AA),
      "tertiary800": Color(0xFFFFE9D5),
      "tertiary900": Color(0xFFFFF2E5),
      "tertiary950": Color(0xFFFFFAF5),
      "text0": Color(0xFF171717),
      "text50": Color(0xFF262627),
      "text100": Color(0xFF404040),
      "text200": Color(0xFF525252),
      "text300": Color(0xFF737373),
      "text400": Color(0xFF8C8C8C),
      "text500": Color(0xFFA3A3A3),
      "text600": Color(0xFFD4D4D4),
      "text700": Color(0xFFDBDBDC),
      "text800": Color(0xFFE5E5E5),
      "text900": Color(0xFFF5F5F5),
      "text950": Color(0xFFFEFEFF),
      "background0": Color(0xFFE0FFFF),
      "background50": Color(0xFF272625),
      "background100": Color(0xFF414040),
      "background200": Color(0xFF535252),
      "background300": Color(0xFF747474),
      "background400": Color(0xFF8E8E8E),
      "background500": Color(0xFFA2A3A3),
      "background600": Color(0xFFD5D4D4),
      "background700": Color(0xFFDCDBEB),
      "background800": Color(0xFFF2F1F1),
      "background900": Color(0xFFF6F6F6),
      "background950": Color(0xFFFEFEFE),
      "border0": Color(0xFF1A1717),
      "border50": Color(0xFF272624),
      "border100": Color(0xFF414141),
      "border200": Color(0xFF535252),
      "border300": Color(0xFF737474),
      "border400": Color(0xFF8C8D8D),
      "border500": Color(0xFFA5A3A3),
      "border600": Color(0xFFD3D3D3),
      "border700": Color(0xFFDDDCDB),
      "border800": Color(0xFFE6E6E6),
      "border900": Color(0xFFF3F3F3),
      "border950": Color(0xFFFDFEFE),
      "success0": Color(0xFF1B3224),
      "success50": Color(0xFF14532D),
      "success100": Color(0xFF166534),
      "success200": Color(0xFF206F3E),
      "success300": Color(0xFF2A7948),
      "success400": Color(0xFF348352),
      "success500": Color(0xFF489766),
      "success600": Color(0xFF66B584),
      "success700": Color(0xFF84D3A2),
      "success800": Color(0xFFA2F1C0),
      "success900": Color(0xFFCAFFE8),
      "success950": Color(0xFFE4FFF4),
      "error0": Color(0xFF531313),
      "error50": Color(0xFF7F1D1D),
      "error100": Color(0xFF991B1B),
      "error200": Color(0xFFB91C1C),
      "error300": Color(0xFFDC2626),
      "error400": Color(0xFFE63535),
      "error500": Color(0xFFEF4444),
      "error600": Color(0xFFF87171),
      "error700": Color(0xFFE63534),
      "error800": Color(0xFFFECACA),
      "error900": Color(0xFFFEE2E2),
      "error950": Color(0xFFFEE9E9),
      "warning0": Color(0xFF542D12),
      "warning50": Color(0xFF6C3813),
      "warning100": Color(0xFF824417),
      "warning200": Color(0xFFB45A1A),
      "warning300": Color(0xFFD76C1F),
      "warning400": Color(0xFFE77828),
      "warning500": Color(0xFFFB954B),
      "warning600": Color(0xFFFDAD74),
      "warning700": Color(0xFFFECDAA),
      "warning800": Color(0xFFFFE7D5),
      "warning900": Color(0xFFFFF9F5),
      "warning950": Color(0xFFFFFDFB),
      "info0": Color(0xFF032638),
      "info50": Color(0xFF05405D),
      "info100": Color(0xFF075A83),
      "info200": Color(0xFF0973A8),
      "info300": Color(0xFF0B8DCD),
      "info400": Color(0xFF0DA6F2),
      "info500": Color(0xFF32B4F4),
      "info600": Color(0xFF57C2F6),
      "info700": Color(0xFF7CCFF8),
      "info800": Color(0xFFA2DDFA),
      "info900": Color(0xFFC7EBFC),
      "info950": Color(0xFFECF8FE),
      "backgroundError": Color(0xFF422B2B),
      "backgroundWarning": Color(0xFF412F23),
      "backgroundSuccess": Color(0xFF1C2B21),
      "backgroundMuted": Color(0xFF252526),
      "backgroundInfo": Color(0xFF1A282E),
    }
  }
};
