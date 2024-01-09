import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/providers/theme_provider/theme_provider.dart';
import 'package:gluestack_ui_example/widgets/nav_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gluestack UI examples')),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: GSCenter(
            child: GSVStack(
              space: GSSpaces.$sm,
              children: [
                SizedBox(height: 10),
                NavButton(title: "Storybook", routePath: "/storybook"),
                NavButton(title: "GS Form", routePath: "/example-form"),
                NavButton(title: "GS Fab", routePath: "/example-fab"),
                NavButton(title: "GS Switch", routePath: "/example-switch"),
                NavButton(title: "GS Link", routePath: "/example-link"),
                NavButton(title: "GS Avatar", routePath: "/example-avatar"),
                NavButton(title: "GS Text", routePath: "/example-text"),
                NavButton(title: "GS CheckBox", routePath: "/example-checkbox"),
                NavButton(title: "GS Heading", routePath: "/example-heading"),
                NavButton(title: "GS HStack", routePath: "/example-hstack"),
                NavButton(title: "GS VStack", routePath: "/example-vstack"),
                NavButton(title: "GS Button", routePath: "/example-button"),
                NavButton(title: "GS Image", routePath: "/example-image"),
                NavButton(title: "GS Input", routePath: "/example-input"),
                NavButton(
                  title: "GS Radio Button",
                  routePath: "/example-radio_button",
                ),
                NavButton(title: "GS Badge", routePath: "/example-badge"),
                NavButton(title: "GS Center", routePath: "/example-center"),
                NavButton(title: "GS Alert", routePath: "/example-alert"),
                NavButton(title: "GS Divider", routePath: "/example-divider"),
                NavButton(title: "GS Spinner", routePath: "/example-spinner"),
                NavButton(title: "GS Progress", routePath: "/example-progress"),
                NavButton(title: "GS Icon", routePath: "/example-icon"),
                NavButton(
                  title: "GS Text Area",
                  routePath: "/example-text_area",
                ),
                NavButton(
                  title: "GS Pressable",
                  routePath: "/example-pressable",
                ),
                NavButton(title: "GS Toast", routePath: "/example-toast"),
                NavButton(title: "GS Flex", routePath: "/example-flex"),
                SizedBox(height: 10),

                // Previews are present to link Docs website to these storybook pages.
                // No need to show these pages separately in example app.
                // NavButton(title: "Preview Button", routePath: "/buttonPreview"),
                // NavButton(title: "Preview Input", routePath: "/inputPreview"),
                // NavButton(title: "Preview Badge", routePath: "/badgePreview"),
                // NavButton(title: "Preview Switch", routePath: "/switchPreview"),
                // NavButton(title: "Preview Avatar", routePath: "/avatarPreview"),
                // NavButton(
                //     title: "Preview Checkbox", routePath: "/checkboxPreview"),
                // NavButton(title: "Preview HStack", routePath: "/hstackPreview"),
                // NavButton(title: "Preview VStack", routePath: "/vstackPreview"),
                // NavButton(title: "Preview Image", routePath: "/imagePreview"),
                // NavButton(
                //     title: "Preview Radio Button",
                //     routePath: "/radioButtonPreview"),
                // NavButton(
                //     title: "Preview Progress", routePath: "/progressPreview"),
                // NavButton(title: "Preview Icon", routePath: "/iconPreview"),
                // NavButton(title: "Preview Text", routePath: "/textPreview"),
                // NavButton(title: "Preview Heading", routePath: "/headingPreview"),
                // NavButton(title: "Preview Divider", routePath: "/dividerPreview"),
                // NavButton(title: "Preview Center", routePath: "/centerPreview"),
                // NavButton(title: "Preview Box", routePath: "/boxPreview"),
                // NavButton(title: "Preview Spinner", routePath: "/spinnerPreview"),
                // NavButton(title: "Preview Toast", routePath: "/toastPreview"),
                // NavButton(title: "Preview Link", routePath: "/linkPreview"),
                // NavButton(
                //     title: "Preview Pressable", routePath: "/pressablePreview"),
                // NavButton(
                //     title: "Preview Text Area", routePath: "/textareaPreview"),
                // NavButton(
                //     title: "Preview Alert Dialog",
                //     routePath: "/alertDialogPreview"),
                // NavButton(title: "Preview Fab", routePath: "/fabPreview"),
              ],
            ),
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
