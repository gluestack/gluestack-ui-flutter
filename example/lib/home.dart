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
                  router.go("/loadingButtonPreview");
                },
                child: const Text(
                  'Loading Button Preview',
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
                  router.go("/iconButtonPreview");
                },
                child: const Text(
                  'Icon Button Preview',
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
                  router.go("/buttonGroupPreview");
                },
                child: const Text(
                  'Button Group Preview',
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
                  router.go("/buttonWithIconsPreview");
                },
                child: const Text(
                  'Button With Icons Preview',
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
                  router.go("/buttonWithLinkPreview");
                },
                child: const Text(
                  'Button With Link Preview',
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
                  router.go("/buttonWithFullWidthPreview");
                },
                child: const Text(
                  'Button With Full Width Preview',
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
                  router.go("/badgeWithAvatarPreview");
                },
                child: const Text(
                  'Preview Badge with Avatar',
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
                  router.go("/avatarPreview");
                },
                child: const Text(
                  'Preview Avatar',
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
                  router.go("/checkboxPreview");
                },
                child: const Text(
                  'Preview Checkbox',
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
                  router.go("/multipleCheckboxPreview");
                },
                child: const Text(
                  'Preview Multiple Checkbox',
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
                  router.go("/multipleCheckboxHorizontalPreview");
                },
                child: const Text(
                  'Preview Multiple Horizontal Checkbox',
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
                  router.go("/checkboxWithHelpTextPreview");
                },
                child: const Text(
                  'Preview Checkbox With Help Text',
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
                  router.go("/formControlCheckboxPreview");
                },
                child: const Text(
                  'Preview FormControl Checkbox',
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
                  router.go("/controlledCheckboxPreview");
                },
                child: const Text(
                  'Preview Controlled Checkbox',
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
                  router.go("/uncontrolledCheckboxPreview");
                },
                child: const Text(
                  'Preview Uncontrolled Checkbox',
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
                  router.go("/checkboxGroupPreview");
                },
                child: const Text(
                  'Preview Group Checkbox',
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
                  router.go("/hstackPreview");
                },
                child: const Text(
                  'Preview HStack',
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
                  router.go("/hstackReversedPreview");
                },
                child: const Text(
                  'Preview Reversed HStack',
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
                  router.go("/vstackPreview");
                },
                child: const Text(
                  'Preview VStack',
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
                  router.go("/vstackReversedPreview");
                },
                child: const Text(
                  'Preview Reversed VStack',
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
                  router.go("/imagePreview");
                },
                child: const Text(
                  'Preview Image',
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
                  router.go("/radioButtonPreview");
                },
                child: const Text(
                  'Preview Radio Button',
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
                  router.go("/progressPreview");
                },
                child: const Text(
                  'Preview Progress',
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
                  router.go("/progressValuePreview");
                },
                child: const Text(
                  'Preview Progress Value',
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
                  router.go("/progressColorsPreview");
                },
                child: const Text(
                  'Preview Progress Colors',
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
                  router.go("/progressCustomPreview");
                },
                child: const Text(
                  'Preview Custom Progress',
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
                  router.go("/iconPreview");
                },
                child: const Text(
                  'Preview Icon',
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
                  router.go("/textPreview");
                },
                child: const Text(
                  'Preview Text',
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
                  router.go("/headingPreview");
                },
                child: const Text(
                  'Preview Heading',
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
                  router.go("/dividerPreview");
                },
                child: const Text(
                  'Preview Divider',
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
                  router.go("/dividerVariantsPreview");
                },
                child: const Text(
                  'Preview Divider Variants',
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
                  router.go("/centerPreview");
                },
                child: const Text(
                  'Preview Center',
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
                  router.go("/boxPreview");
                },
                child: const Text(
                  'Preview Box',
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
                  router.go("/spinnerPreview");
                },
                child: const Text(
                  'Preview Spinner',
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
                  router.go("/spinnerWithLabelPreview");
                },
                child: const Text(
                  'Preview Spinner with label',
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
                  router.go("/spinnerWithColorsPreview");
                },
                child: const Text(
                  'Preview Spinner with Colors',
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
                  router.go("/toastPreview");
                },
                child: const Text(
                  'Preview Toast',
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
                  router.go("/linkPreview");
                },
                child: const Text(
                  'Preview Link',
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
                  router.go("/pressablePreview");
                },
                child: const Text(
                  'Preview Pressable',
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
                  router.go("/textareaPreview");
                },
                child: const Text(
                  'Preview Text Area',
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
                  router.go("/alertDialogPreview");
                },
                child: const Text(
                  'Preview Alert Dialog',
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
                  router.go("/fabPreview");
                },
                child: const Text(
                  'Preview Fab',
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
