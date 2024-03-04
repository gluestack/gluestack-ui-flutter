import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/providers/theme_provider/theme_provider.dart';

import 'widgets/components/layout/nav_button.dart';
// import 'package:gluestack_ui_example/widgets/storybook_widgets/public.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: GSTheme.of(context).brightness == Brightness.dark
            ? const Color(0xFF262626)
            : null,
        title: const GSText(
          text: 'Gluestack UI examples',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GSCenter(
            child: GSVStack(
              space: GSVstackSpaces.$xl,
              children: [
                const SizedBox(height: 10),
                const NavButton(
                  title: "Storybook",
                  routePath: "/storybook",
                ),
                GSLink(
                  url: 'https://kitchensink-23184.web.app/',
                  text: GSLinkText(
                    text: 'KitchenSink',
                    style: GSStyle(
                        textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    )),
                  ),
                ),
                const NavButton(
                  title: "GS Form",
                  routePath: "/example-form",
                ),
                const NavButton(
                  title: "GS Fab",
                  routePath: "/example-fab",
                ),
                const NavButton(
                  title: "GS Switch",
                  routePath: "/example-switch",
                ),
                const NavButton(
                  title: "GS Link",
                  routePath: "/example-link",
                ),
                const NavButton(
                  title: "GS Avatar",
                  routePath: "/example-avatar",
                ),
                const NavButton(
                  title: "GS Text",
                  routePath: "/example-text",
                ),
                const NavButton(
                  title: "GS CheckBox",
                  routePath: "/example-checkbox",
                ),
                const NavButton(
                  title: "GS Heading",
                  routePath: "/example-heading",
                ),
                const NavButton(
                  title: "GS HStack",
                  routePath: "/example-hstack",
                ),
                const NavButton(
                  title: "GS VStack",
                  routePath: "/example-vstack",
                ),
                const NavButton(
                  title: "GS Button",
                  routePath: "/example-button",
                ),
                const NavButton(
                  title: "GS Image",
                  routePath: "/example-image",
                ),
                const NavButton(
                  title: "GS Input",
                  routePath: "/example-input",
                ),
                const NavButton(
                  title: "GS Radio Button",
                  routePath: "/example-radio_button",
                ),
                const NavButton(
                  title: "GS Badge",
                  routePath: "/example-badge",
                ),
                const NavButton(
                  title: "GS Center",
                  routePath: "/example-center",
                ),
                const NavButton(
                  title: "GS Alert",
                  routePath: "/example-alert",
                ),
                const NavButton(
                  title: "GS Divider",
                  routePath: "/example-divider",
                ),
                const NavButton(
                  title: "GS Spinner",
                  routePath: "/example-spinner",
                ),
                const NavButton(
                  title: "GS Progress",
                  routePath: "/example-progress",
                ),
                const NavButton(
                  title: "GS Icon",
                  routePath: "/example-icon",
                ),
                const NavButton(
                  title: "GS Text Area",
                  routePath: "/example-text_area",
                ),
                const NavButton(
                  title: "GS Pressable",
                  routePath: "/example-pressable",
                ),
                const NavButton(
                  title: "GS Toast",
                  routePath: "/example-toast",
                ),
                const NavButton(
                  title: "GS Flex",
                  routePath: "/example-flex",
                ),
                const NavButton(
                  title: "GS Stack",
                  routePath: "/example-stack",
                ),
                const NavButton(
                  title: "GS Scroll",
                  routePath: "/example-scroll",
                ),
                const NavButton(
                  title: "GS Icon Button",
                  routePath: "/example-icon-button",
                ),
                const NavButton(
                  title: "GS Accordion",
                  routePath: "/example-accordion",
                ),

                // // ===== Internal Testing Widgets =====
                // const NavButton(
                //   title: "GS Color Test (Internal)",
                //   routePath: "/internal-color-test",
                // ),

                // Preview screens are present to link Docs website to these storybook pages through iframe.
                // No need to show these pages separately in example app.
                // ...kStories.map((item) => NavButton(
                //       title: 'Preview ${item.storyName}',
                //       routePath: '/${item.routePath}',
                //     )),

                const SizedBox(height: 10),
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
              GSTheme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          );
        },
      ),
    );
  }
}
