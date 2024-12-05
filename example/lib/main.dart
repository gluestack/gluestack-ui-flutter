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
              title: 'Gluestack-ui Flutter Examples',
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
      "secondary0": Color(0xFF80DEEA),
      "secondary50": Color(0xFF4DD0E1),
      "secondary100": Color(0xFF26C6DA),
      "secondary200": Color(0xFF00BCD4),
      "secondary300": Color(0xFF00ACC1),
      "secondary400": Color(0xFF0097A7),
      "secondary500": Color(0xFF00838F),
      "secondary600": Color(0xFF006064),
      "secondary700": Color(0xFF004D40),
      "secondary800": Color(0xFF00332A),
      "secondary900": Color(0xFF00251A),
      "secondary950": Color(0xFF001013),
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
      "background950": Color(0xFFFEFEFE)
    }
  },
  "sunset_theme": {
    "colors": {
      "primary0": Color(0xFFFFE0B2),
      "primary50": Color(0xFFFFCC80),
      "primary100": Color(0xFFFFB74D),
      "primary200": Color(0xFFFFA726),
      "primary300": Color(0xFFFF9800),
      "primary400": Color(0xFFFB8C00),
      "primary500": Color(0xFFF57C00),
      "primary600": Color(0xFFEF6C00),
      "primary700": Color(0xFFE65100),
      "primary800": Color(0xFFDD2C00),
      "primary900": Color(0xFFBF360C),
      "primary950": Color(0xFF3E2723),
      "secondary0": Color(0xFFFFCC80),
      "secondary50": Color(0xFFFFB74D),
      "secondary100": Color(0xFFFFA726),
      "secondary200": Color(0xFFFF9800),
      "secondary300": Color(0xFFFB8C00),
      "secondary400": Color(0xFFF57C00),
      "secondary500": Color(0xFFEF6C00),
      "secondary600": Color(0xFFE65100),
      "secondary700": Color(0xFFDD2C00),
      "secondary800": Color(0xFFBF360C),
      "secondary900": Color(0xFF3E2723),
      "secondary950": Color(0xFF212121),
      "background0": Color(0xFFFFF3E0),
      "background50": Color(0xFF5D4037),
      "background100": Color(0xFF6D4C41),
      "background200": Color(0xFF795548),
      "background300": Color(0xFF8D6E63),
      "background400": Color(0xFFA1887F),
      "background500": Color(0xFFBCAAA4),
      "background600": Color(0xFFD7CCC8),
      "background700": Color(0xFFEFEFEF),
      "background800": Color(0xFFF5F5F5),
      "background900": Color(0xFFFAFAFA),
      "background950": Color(0xFFFFFFFF)
    }
  },
  "forest_theme": {
    "colors": {
      "primary0": Color(0xFFE8F5E9),
      "primary50": Color(0xFFC8E6C9),
      "primary100": Color(0xFFA5D6A7),
      "primary200": Color(0xFF81C784),
      "primary300": Color(0xFF66BB6A),
      "primary400": Color(0xFF4CAF50),
      "primary500": Color(0xFF43A047),
      "primary600": Color(0xFF388E3C),
      "primary700": Color(0xFF2E7D32),
      "primary800": Color(0xFF1B5E20),
      "primary900": Color(0xFF004D40),
      "primary950": Color(0xFF00332A),
      "secondary0": Color(0xFFC8E6C9),
      "secondary50": Color(0xFFA5D6A7),
      "secondary100": Color(0xFF81C784),
      "secondary200": Color(0xFF66BB6A),
      "secondary300": Color(0xFF4CAF50),
      "secondary400": Color(0xFF43A047),
      "secondary500": Color(0xFF388E3C),
      "secondary600": Color(0xFF2E7D32),
      "secondary700": Color(0xFF1B5E20),
      "secondary800": Color(0xFF004D40),
      "secondary900": Color(0xFF00332A),
      "secondary950": Color(0xFF00251A),
      "background0": Color(0xFFE8F5E9),
      "background50": Color(0xFFBDBDBD),
      "background100": Color(0xFF9E9E9E),
      "background200": Color(0xFF757575),
      "background300": Color(0xFF616161),
      "background400": Color(0xFF424242),
      "background500": Color(0xFF212121),
      "background600": Color(0xFF121212),
      "background700": Color(0xFF101010),
      "background800": Color(0xFF0D0D0D),
      "background900": Color(0xFF050505),
      "background950": Color(0xFF000000)
    }
  },
  "lavender_theme": {
    "colors": {
      "primary0": Color(0xFFEDE7F6),
      "primary50": Color(0xFFD1C4E9),
      "primary100": Color(0xFFB39DDB),
      "primary200": Color(0xFF9575CD),
      "primary300": Color(0xFF7E57C2),
      "primary400": Color(0xFF673AB7),
      "primary500": Color(0xFF5E35B1),
      "primary600": Color(0xFF512DA8),
      "primary700": Color(0xFF4527A0),
      "primary800": Color(0xFF311B92),
      "primary900": Color(0xFF1A237E),
      "primary950": Color(0xFF0D1033),
      "secondary0": Color(0xFFD1C4E9),
      "secondary50": Color(0xFFB39DDB),
      "secondary100": Color(0xFF9575CD),
      "secondary200": Color(0xFF7E57C2),
      "secondary300": Color(0xFF673AB7),
      "secondary400": Color(0xFF5E35B1),
      "secondary500": Color(0xFF512DA8),
      "secondary600": Color(0xFF4527A0),
      "secondary700": Color(0xFF311B92),
      "secondary800": Color(0xFF1A237E),
      "secondary900": Color(0xFF0D1033),
      "secondary950": Color(0xFF0B0B17),
      "background0": Color(0xFFEDE7F6),
      "background50": Color(0xFF6D6D6D),
      "background100": Color(0xFF5A5A5A),
      "background200": Color(0xFF464646),
      "background300": Color(0xFF303030),
      "background400": Color(0xFF212121),
      "background500": Color(0xFF121212),
      "background600": Color(0xFF0F0F0F),
      "background700": Color(0xFF0D0D0D),
      "background800": Color(0xFF0B0B0B),
      "background900": Color(0xFF090909),
      "background950": Color(0xFF050505)
    }
  }
};
