// ignore: library_private_types_in_public_api
import 'gs_exports.dart';

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
        gsColorsToken: const GSColorsToken(
          backgroundDark700: Colors.white,

          textDark200: Colors.blueGrey,

          //  textLight700: $GSColors.blue100, // ==> Causes error
        ),
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
