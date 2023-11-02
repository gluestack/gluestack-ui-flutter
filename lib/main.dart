import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

// import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio.dart';
import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_icon.dart';

import 'package:gluestack_flutter_pro/widgets/gs_radio/gs_radio_text.dart';
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
                RadioExample(),
                GSButton(
                  // isDisabled: true,
                  // action: GSActions.negative,
                  // variant: GSVariants.solid,
                  // size: GSSizes.lg,
                  onPressed: () {},
                  // style: GSStyle(
                  //   web: GSStyle(
                  //       // bg: $GSColors.amber600,
                  //       ),
                  //   ios: GSStyle(
                  //     bg: $GSColors.pink600,
                  //   ),
                  //   onHover: GSStyle(
                  //     bg: $GSColors.green400,
                  //   ),
                  //   md: GSStyle(
                  //     bg: $GSColors.pink400,
                  //   ),
                  // ),
                  child: const GSButtonText(text: "Click Here"),
                ),

                GSButtonGroup(
                  // isDisabled: true,
                  reversed: true,
                  isAttached: true,
                  direction: GSDirection.row,
                  size: GSSizes.md,
                  space: GSSpaces.xl,
                  style: GSStyle(
                    bg: $GSColors.green500,
                    // height: 200,
                  ),
                  gsButtons: [
                    GSButton(
                      onPressed: () {},
                      isDisabled: false,
                      action: GSActions.negative,
                      style: GSStyle(
                        onHover: GSStyle(
                          bg: $GSColors.amber300,
                        ),
                      ),
                      child: const GSButtonText(text: "Click Here"),
                    ),
                    GSButton(
                      child: const GSButtonText(text: "Click Here"),
                      onPressed: () {},
                    ),
                    GSButton(
                      child: const GSButtonText(text: "Click Here"),
                      onPressed: () {},
                    )
                  ],
                ),

                // GSInput(
                //   size: GSSizes.xl,
                //   variant: GSVariants.outline,
                //   hintText: "Enter text here",
                //   style: GSStyle(
                //     width: 300,
                //     borderColor: $GSColors.pink500,
                //     onFocus: GSStyle(
                //       borderColor: $GSColors.purple800,
                //       borderWidth: $GSBorderWidth.$2,
                //       borderBottomWidth: $GSBorderWidth.$2,
                //     ),
                //     onHover: GSStyle(
                //       borderColor: $GSColors.green600,
                //       borderWidth: $GSBorderWidth.$4,
                //       borderBottomWidth: $GSBorderWidth.$4,
                //     ),
                //     xs: GSStyle(
                //       borderColor: $GSColors.purple400,
                //     ),
                //     dark: GSStyle(
                //       borderColor: $GSColors.warmGray900,
                //       borderWidth: $GSBorderWidth.$8,
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

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

enum Value { one, two, three, four }

class _RadioExampleState extends State<RadioExample> {
  Value groupValue = Value.one;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GSRadio<Value>(
          style: GSStyle(
            checked: GSStyle(
              color: $GSColors.purple500,
              onHover: GSStyle(
                color: $GSColors.pink300,
              ),
            ),
          ),
          value: Value.one,
          groupValue: groupValue,
          onChanged: (p0) {
            setState(
              () {
                groupValue = p0!;
              },
            );
          },
          icon: const GSRadioIcon<Value>(),
          label: const GSRadioText<Value>(text: 'text1'),
        ),
        GSRadio<Value>(
          isInvalid: true,
          value: Value.two,
          groupValue: groupValue,
          onChanged: (p0) {
            setState(
              () {
                groupValue = p0!;
              },
            );
          },
          icon: const GSRadioIcon<Value>(),
          label: const GSRadioText<Value>(text: 'text2'),
        ),
        GSRadio<Value>(
          isDisabled: true,
          value: Value.three,
          groupValue: groupValue,
          onChanged: (p0) {
            setState(
              () {
                groupValue = p0!;
              },
            );
          },
          icon: const GSRadioIcon<Value>(),
          label: const GSRadioText<Value>(text: 'text3'),
        ),
        GSRadio<Value>(
          value: Value.four,
          groupValue: groupValue,
          onChanged: (p0) {
            setState(() {
              groupValue = p0!;
            });
          },
          icon: const GSRadioIcon<Value>(),
          label: const GSRadioText<Value>(text: 'text4'),
        ),
      ],
    );
  }
}
