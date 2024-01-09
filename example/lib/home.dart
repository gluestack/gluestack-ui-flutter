import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui_example/providers/theme_provider/theme_provider.dart';
import 'package:gluestack_ui_example/routes/router.dart';

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
                  router.go("/storybook");
                },
                child: const Text(
                  'Storybook',
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
                  router.go('/example-form');
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
                  router.go('/example-fab');
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
                  router.go('/example-switch');
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
                  router.go('/example-link');
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
                  router.go('/example-avatar');
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
                  router.go('/example-text');
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
                  router.go('/example-checkbox');
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
                  router.go('/example-heading');
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
                  router.go('/example-hstack');
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
                  router.go('/example-vstack');
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
                  router.go('/example-button');
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
                  router.go('/example-image');
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
                  router.go('/example-input');
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
                  router.go('/example-radio_button');
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
                  router.go('/example-badge');
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
                  router.go('/example-center');
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
                  router.go('/example-alert');
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
                  router.go('/example-divider');
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
                  router.go('/example-spinner');
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
                  router.go('/example-progress');
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
                  router.go('/example-icon');
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
                  router.go('/example-text_area');
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
                  router.go('/example-pressable');
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
                  router.go('/example-toast');
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
                  router.go('/example-flex');
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
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: ref.read(toggleThemeProvider.notifier).toggleThemeMode,
            child: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          );
        },
      ),
    );
  }
}
