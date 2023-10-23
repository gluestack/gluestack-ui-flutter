import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';
import 'package:provider/provider.dart';

import 'token/index.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GSButton(
                  action: GSButtonAction.negative,
                  variant: GSButtonVariant.solid,
                  size: GSButtonSize.lg,
                  onPressed: () {},
                  style: GSGeneratedStyle(
                    xs: GSGeneratedStyle(
                      color: $GSColors.purple400,
                    ),
                    lg: GSGeneratedStyle(
                      color: $GSColors.warning800,
                    ),
                    dark: GSGeneratedStyle(
                      color: $GSColors.blueGray700,
                      sm: GSGeneratedStyle(
                        color: $GSColors.amber300,
                      ),
                      md: GSGeneratedStyle(
                        color: $GSColors.green400,
                      ),
                    ),
                  ),
                  child: const GSButtonText(text: "Click Here"),
                ),
                // GSInput(
                //   size: GSInputSize.xl,
                //   variant: GSInputVariant.rounded,
                //   hintText: "Enter Text Here",
                //   enabled: true,
                //   style: GSGeneratedStyle(
                //     width: 200,
                //     xs: GSGeneratedStyle(
                //       borderColor: $GSColors.purple400,
                //     ),
                //     lg: GSGeneratedStyle(
                //       borderColor: $GSColors.warning800,
                //     ),
                //     dark: GSGeneratedStyle(
                //       borderColor: $GSColors.blueGray700,
                //       sm: GSGeneratedStyle(
                //         borderColor: $GSColors.amber300,
                //       ),
                //       md: GSGeneratedStyle(
                //         borderColor: $GSColors.green400,
                //       ),
                //     ),
                //   ),
                // ),
                // GSBox(
                //   style: StyleData(
                //     context,
                //     color: $GSColors.primary500,
                //     width: 200,
                //     height: 200,
                //     padding: const EdgeInsets.symmetric(
                //       vertical: $GSSpace.$5,
                //       horizontal: $GSSpace.$5,
                //     ),
                //     borderRadius: $GSRadii.$sm,
                //   )
                //       .onDark(color: $GSColors.purple800)
                //       .sm(color: $GSColors.green500)
                //       .smDark(color: $GSColors.amber400),
                //   child: const Text(
                //     "I am a container",
                //     style: TextStyle(
                //       color: $GSColors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            child: Icon(themeProvider.currentTheme == GSThemeMode.light
                ? Icons.light_mode
                : Icons.dark_mode),
          ),
        ),
      );
    });
  }
}
