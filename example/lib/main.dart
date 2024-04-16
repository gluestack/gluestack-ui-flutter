import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

// import 'package:gluestack_ui_example/custom_config.dart';
// import 'package:gluestack_ui_example/providers/theme_provider/theme_provider.dart';
import 'package:gluestack_ui_example/routes/router.dart';

import 'providers/theme_provider/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GSThemes currentTheme = GSThemes.light;
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
      child: Consumer(
        builder: (context, ref, child) {
          final GSThemeMode? currentThemeMode = ref.watch(toggleThemeProvider);
          // MaterialApp(darkTheme: ThemeData,)

          return GSTheme(
            data: GSThemeData.fromTheme(GSThemes.light),
            child: GSApp.router(
              debugShowCheckedModeBanner: false,
              color: $GSColors.primary500,
              routerConfig: ree((GSThemes newTheme) {
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
