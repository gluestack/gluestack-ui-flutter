import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/preview_widgets/button_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/input_preview.dart';
import 'package:gluestack_ui_example/preview_widgets/badge_preview.dart';
import 'package:gluestack_ui_example/routes/router.dart';
import 'package:provider/provider.dart';

import 'example/public.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getThemeData(),
        );
      },
    );
  }
}
