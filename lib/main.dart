import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/MainPage.dart';
import 'package:gluestack_flutter_pro/example/alert_example.dart';
import 'package:gluestack_flutter_pro/example/avatar_example.dart';
import 'package:gluestack_flutter_pro/example/badge_example.dart';
import 'package:gluestack_flutter_pro/example/button_example.dart';
import 'package:gluestack_flutter_pro/example/center_example.dart';
import 'package:gluestack_flutter_pro/example/checkbox_example.dart';
import 'package:gluestack_flutter_pro/example/divider_example.dart';
import 'package:gluestack_flutter_pro/example/heading_example.dart';
import 'package:gluestack_flutter_pro/example/hstack_example.dart';
import 'package:gluestack_flutter_pro/example/icon_example.dart';
import 'package:gluestack_flutter_pro/example/image_example.dart';
import 'package:gluestack_flutter_pro/example/input_example.dart';
import 'package:gluestack_flutter_pro/example/link_example.dart';
import 'package:gluestack_flutter_pro/example/progress_example.dart';
import 'package:gluestack_flutter_pro/example/pressable_example.dart';
import 'package:gluestack_flutter_pro/example/radio_button_example.dart';
import 'package:gluestack_flutter_pro/example/spinner_example.dart';
import 'package:gluestack_flutter_pro/example/text_area_example.dart';
import 'package:gluestack_flutter_pro/example/text_example.dart';
import 'package:gluestack_flutter_pro/example/toast_example.dart';
import 'package:gluestack_flutter_pro/example/vstack_example.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_indicator.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_label.dart';

// import 'package:gluestack_flutter_pro/widgets/gs_input/gs_input.dart';

import 'package:provider/provider.dart';

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
          body: SingleChildScrollView(
            child: Container(
              height: 1300,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Scroll more for all the components",
                      style: TextStyle(fontSize: 22)),
                 GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const LayoutExample(),
                      ));
                    },
                    child: const Text(
                      'Ex: GS Layout 1',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const LinkExample(),
                      ));
                    },
                    child: const Text(
                      'GS Link',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const AvatarExample(),
                      ));
                    },
                    child: const Text(
                      'GS Avatar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const TextExample(),
                      ));
                    },
                    child: const Text(
                      'GS Text',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const CheckBoxExample(),
                      ));
                    },
                    child: const Text(
                      'GS CheckBox',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const HeadingExample(),
                      ));
                    },
                    child: const Text(
                      'GS Heading',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const HStackExample(),
                      ));
                    },
                    child: const Text(
                      'GS HStack',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const VStackExample(),
                      ));
                    },
                    child: const Text(
                      'GS VStack',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const ButtonExample(),
                      ));
                    },
                    child: const Text(
                      'GS Button',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const ImageExample(),
                      ));
                    },
                    child: const Text(
                      'GS Image',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const InputExample(),
                      ));
                    },
                    child: const Text(
                      'GS Input',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const RadioButtonExample(),
                      ));
                    },
                    child: const Text(
                      'GS Radio Button',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const BadgeExample(),
                      ));
                    },
                    child: const Text(
                      'GS Badge',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const CenterExample(),
                      ));
                    },
                    child: const Text(
                      'GS Center',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const AlertExample(),
                      ));
                    },
                    child: const Text(
                      'GS Alert',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const DividerExample(),
                      ));
                    },
                    child: const Text(
                      'GS Divider',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const SpinnerExample(),
                      ));
                    },
                    child: const Text(
                      'GS Spinner',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const ProgressExample(),
                      ));
                    },
                    child: const Text(
                      'GS Progress',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const IconExample(),
                      ));
                    },
                    child: const Text(
                      'GS Icon',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const TextAreaExample(),
                      ));
                    },
                    child: const Text(
                      'GS Text Area',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const PressableExample(),
                      ));
                    },
                    child: const Text(
                      'GS Pressable',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!.push(MaterialPageRoute(
                        builder: (context) => const ToastExample(),
                      ));
                    },
                    child: const Text(
                      'GS Toast',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
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
