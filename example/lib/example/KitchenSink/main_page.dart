import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:provider/provider.dart';

import 'components/banner.dart';
import 'components/header.dart';
import 'components/main_component.dart';
import 'components/sidebar/sidebar.dart';

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        body: SafeArea(
          child: GSVStack(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const KSBanner(),
              KSHeader(
                themeProvider: themeProvider,
                themeCallback: () {
                  themeProvider.toggleTheme();
                },
              ),
              Expanded(
                child: GSBox(
                  style: GSStyle(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 21),
                  ),
                  child: const GSHStack(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: SingleChildScrollView(
                            child: KSSideBar(),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: KSMainComponent(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
