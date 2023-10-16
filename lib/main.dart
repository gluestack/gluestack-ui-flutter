import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/color_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button_text/gs_button_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_container/gs_container.dart';
import 'package:gluestack_flutter_pro/style/style_data.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';
import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_token.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_icon/gs_radio_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio_text/gs_radio_text.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GSButton(
                  action: GSButtonAction.primary,
                  variant: GSButtonVariant.solid,
                  size: GSButtonSize.xs,
                  onPressed: () {},
                  style: StyleData(context)
                      .onDark(color: $GSColors.purple800)
                      .sm(color: $GSColors.green500)
                      .smDark(color: $GSColors.amber400),
                  child: const GSButtonText(text: "Click Here"),
                ),
                GSRadio(
                    size: GSRadioSize.sm,
                    isEnabled: false,
                    label:const GSRadioText(text: "Label"),
                    icon: GSRadioIcon(
                      value: '1',
                      groupValue: '2',
                      onChanged: (p0) {},
                    )),                   
                    
                GSBox(
                  style: StyleData(
                    context,
                    color: $GSColors.primary500,
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                      vertical: $GSSpace.$5,
                      horizontal: $GSSpace.$5,
                    ),
                    borderRadius: $GSRadii.$sm,
                  )
                      .onDark(color: $GSColors.purple800)
                      .sm(color: $GSColors.green500)
                      .smDark(color: $GSColors.amber400),
                  child: const Text(
                    "I am a container",
                    style: TextStyle(
                      color: $GSColors.white,
                    ),
                  ),
                ),
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
