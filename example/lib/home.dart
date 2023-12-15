import 'package:flutter/material.dart';
import 'package:gluestack_ui_example/example/fab_example.dart';
import 'package:gluestack_ui_example/example/flex_example.dart';
import 'package:gluestack_ui_example/main.dart';
import 'package:gluestack_ui_example/routes/router.dart';

import 'example/public.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const elementSpacing = SizedBox(height: 20);
    return Scaffold(
      appBar: AppBar(title: const Text('Gluestack UI examples')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              elementSpacing,
              GestureDetector(
                onTap: () {
                  router.go("/buttonPreview");
                },
                child: const Text(
                  'Preview Button',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  router.go("/inputPreview");
                },
                child: const Text(
                  'Preview Input',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  router.go("/badgePreview");
                },
                child: const Text(
                  'Preview Badge',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  router.go("/switchPreview");
                },
                child: const Text(
                  'Preview Switch',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const FormExample(),
                    ),
                  );
                },
                child: const Text(
                  'GS Form',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const FabExample(),
                    ),
                  );
                },
                child: const Text(
                  'GS Fab',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const SwitchExample(),
                    ),
                  );
                },
                child: const Text(
                  'GS Switch',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const LinkExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const AvatarExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const TextExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const CheckBoxExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const HeadingExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const HStackExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const VStackExample(),
                    ),
                  );
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
              elementSpacing,
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const ImageExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const InputExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const RadioButtonExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const BadgeExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const CenterExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const AlertExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const DividerExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const SpinnerExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const ProgressExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const IconExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const TextAreaExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const PressableExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const ToastExample(),
                    ),
                  );
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
              elementSpacing,
              GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => const FlexExample(),
                    ),
                  );
                },
                child: const Text(
                  'GS Flex',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              elementSpacing,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myAppStateKey.currentState?.toggleThemeMode();
        },
        child: Icon(
          Theme.of(context).brightness == Brightness.dark
              ? Icons.light_mode
              : Icons.dark_mode,
        ),
      ),
    );
  }
}