import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';
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
                // GSButton(
                //   action: GSActions.negative,
                //   variant: GSVariants.solid,
                //   size: GSSizes.lg,
                //   // isDisabled: true,
                //   onPressed: () {},
                //   style: GSStyle(
                //     web: GSStyle(
                //         // bg: $GSColors.amber600,
                //         ),
                //     ios: GSStyle(
                //       bg: $GSColors.pink600,
                //     ),
                //     onHover: GSStyle(
                //       bg: $GSColors.green400,
                //     ),
                //     // md: GSStyle(
                //     //   bg: $GSColors.pink400,

                //     //   onFocus: GSStyle(
                //     //     bg: $GSColors.blueGray600,
                //     //   ),
                //     //   onActive: GSStyle(
                //     //     bg: $GSColors.amber600,
                //     //     borderColor: $GSColors.error500,
                //     //     borderWidth: $GSBorderWidth.$4,
                //     //   ),
                //     //   onDisabled: GSStyle(bg: $GSColors.purple800),
                //     // ),
                //   ),
                //   child: const GSButtonText(text: "Click Here"),
                // ),
                GSInput(
                  size: GSSizes.xl,
                  variant: GSVariants.outline,
                  hintText: "Enter text here",
                  // isDisabled: true,
                  // isInvalid: true,
                  style: GSStyle(
                    width: 300,
                    borderColor: $GSColors.pink500,
                    onFocus: GSStyle(
                      borderColor: $GSColors.purple800,
                      borderWidth: $GSBorderWidth.$2,
                      borderBottomWidth: $GSBorderWidth.$2,
                    ),
                    onHover: GSStyle(
                      borderColor: $GSColors.green600,
                      borderWidth: $GSBorderWidth.$4,
                      borderBottomWidth: $GSBorderWidth.$4,
                    ),
                    xs: GSStyle(
                      borderColor: $GSColors.purple400,
                    ),
                    dark: GSStyle(
                      borderColor: $GSColors.warmGray900,
                      borderWidth: $GSBorderWidth.$8,
                    ),
                  ),
                ),
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
