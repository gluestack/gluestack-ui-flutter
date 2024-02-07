import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      // This is how we can provide custom configuration to Gluestack Theme.
      // gluestackCustomConfig: GluestackCustomConfig(
      //   button: customButton,
      //   buttonText: customButtonText,
      // ),
      child: Consumer(
        builder: (context, ref, child) {
          final GSThemeMode? currentThemeMode = ref.watch(toggleThemeProvider);

          return ScaffoldMessenger(
            child: GSApp.router(
              debugShowCheckedModeBanner: false,
              //gotta add scaffold messenger if using snackbars, which we are!
              color: $GSColors.primary500,
              routerConfig: router,
              themeMode: currentThemeMode,
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],

              darkTheme: GSThemeData(
                brightness: Brightness.dark,

                //  gsColors: GSColorsToken(),
                // visualDensity: GSVisualDensity.standard,
              ),
              theme: GSThemeData(

                  //   gsColors: GSColorsToken(),
                  // visualDensity: VisualDensity.standard,
                  ),
            ),
          );
        },
      ),
    );
  }
}
