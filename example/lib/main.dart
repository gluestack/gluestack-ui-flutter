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
          // final GSThemeMode? currentThemeMode = ref.watch(toggleThemeProvider);
          // MaterialApp(darkTheme: ThemeData,)

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
              // darkTheme: GSThemeData.fromTheme(GSThemes.dark),
              // themeMode: GSThemeMode.system,
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
      "primary0": "#b2ebf2",
      "primary50": "#80deea",
      "primary100": "#4dd0e1",
      "primary200": "#26c6da",
      "primary300": "#00bcd4",
      "primary400": "#00acc1",
      "primary500": "#0097a7",
      "primary600": "#00838f",
      "primary700": "#006064",
      "primary800": "#004d40",
      "primary900": "#00332a",
      "primary950": "#00251a",
      "secondary0": "#b2ebf2",
      "secondary50": "#80deea",
      "secondary100": "#4dd0e1",
      "secondary200": "#26c6da",
      "secondary300": "#00bcd4",
      "secondary400": "#00acc1",
      "secondary500": "#0097a7",
      "secondary600": "#00838f",
      "secondary700": "#006064",
      "secondary800": "#004d40",
      "secondary900": "#00332a",
      "secondary950": "#00251a",
      "tertiary0": "#543112",
      "tertiary50": "#6c3d13",
      "tertiary100": "#824917",
      "tertiary200": "#b4621a",
      "tertiary300": "#d7751f",
      "tertiary400": "#e78128",
      "tertiary500": "#fb9d4b",
      "tertiary600": "#fdb474",
      "tertiary700": "#fed1aa",
      "tertiary800": "#ffe9d5",
      "tertiary900": "#fff2e5",
      "tertiary950": "#fffaf5",
      "text0": "#171717",
      "text50": "#262627",
      "text100": "#404040",
      "text200": "#525252",
      "text300": "#737373",
      "text400": "#8c8c8c",
      "text500": "#a3a3a3",
      "text600": "#d4d4d4",
      "text700": "#dbdbdc",
      "text800": "#e5e5e5",
      "text900": "#f5f5f5",
      "text950": "#fefeff",
      "background0": "#E0FFFF",
      "background50": "#272625",
      "background100": "#414040",
      "background200": "#535252",
      "background300": "#747474",
      "background400": "#8e8e8e",
      "background500": "#a2a3a3",
      "background600": "#d5d4d4",
      "background700": "#dcdbeb",
      "background800": "#f2f1f1",
      "background900": "#f6f6f6",
      "background950": "#fefefe",
      "border0": "#1a1717",
      "border50": "#272624",
      "border100": "#414141",
      "border200": "#535252",
      "border300": "#737474",
      "border400": "#8c8d8d",
      "border500": "#a5a3a3",
      "border600": "#d3d3d3",
      "border700": "#dddcdb",
      "border800": "#e6e6e6",
      "border900": "#f3f3f3",
      "border950": "#fdfefe",
      "success0": "#1b3224",
      "success50": "#14532d",
      "success100": "#166534",
      "success200": "#206f3e",
      "success300": "#2a7948",
      "success400": "#348352",
      "success500": "#489766",
      "success600": "#66b584",
      "success700": "#84d3a2",
      "success800": "#a2f1c0",
      "success900": "#caffe8",
      "success950": "#e4fff4",
      "error0": "#531313",
      "error50": "#7f1d1d",
      "error100": "#991b1b",
      "error200": "#b91c1c",
      "error300": "#dc2626",
      "error400": "#e63535",
      "error500": "#ef4444",
      "error600": "#f87171",
      "error700": "#e63534",
      "error800": "#fecaca",
      "error900": "#fee2e2",
      "error950": "#fee9e9",
      "warning0": "#542d12",
      "warning50": "#6c3813",
      "warning100": "#824417",
      "warning200": "#b45a1a",
      "warning300": "#d76c1f",
      "warning400": "#e77828",
      "warning500": "#fb954b",
      "warning600": "#fdad74",
      "warning700": "#fecdaa",
      "warning800": "#ffe7d5",
      "warning900": "#fff9f5",
      "warning950": "#fffdfb",
      "info0": "#032638",
      "info50": "#05405d",
      "info100": "#075a83",
      "info200": "#0973a8",
      "info300": "#0b8dcd",
      "info400": "#0da6f2",
      "info500": "#32b4f4",
      "info600": "#57c2f6",
      "info700": "#7ccff8",
      "info800": "#a2ddfa",
      "info900": "#c7ebfc",
      "info950": "#ecf8fe",
      "backgroundError": "#422b2b",
      "backgroundWarning": "#412f23",
      "backgroundSuccess": "#1c2b21",
      "backgroundMuted": "#252526",
      "backgroundInfo": "#1a282e",
    }
  }
};
