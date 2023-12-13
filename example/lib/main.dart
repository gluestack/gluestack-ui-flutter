import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/routes/router.dart';

// ignore: library_private_types_in_public_api
GlobalKey<_MyAppState> myAppStateKey = GlobalKey<_MyAppState>();
void main() {
  runApp(MyApp(
    key: myAppStateKey,
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Currently selected theme mode
  ThemeMode _selectedThemeMode = ThemeMode.light;

  void toggleThemeMode() {
    setState(() {
      _selectedThemeMode = switch (_selectedThemeMode) {
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark || ThemeMode.system => ThemeMode.light,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return GluestackProvider(
      gluestackTokenConfig: GluestackTokenConfig(
        gsBorderWidth: const $GSBorderWidth($1og: 36),
        gsSpace: const $GSSpace($5og:6969)
      ),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        themeMode: _selectedThemeMode,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
