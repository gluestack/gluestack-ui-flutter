import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

import 'components/banner.dart';
import 'components/header.dart';
import 'components/main_component.dart';
import 'components/sidebar/sidebar.dart';

class LayoutExample extends StatelessWidget {
  final VoidCallback toggleTheme;

  const LayoutExample({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GSVStack(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const KSBanner(),
            KSHeader(
              themeCallback: toggleTheme,
            ),
            Expanded(
              child: GSBox(
                style: GSStyle(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
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
  }
}
