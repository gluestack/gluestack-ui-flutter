import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/banner.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/header.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/main_component.dart';
import 'package:gluestack_flutter_pro/example/KitchenSink/components/sidebar.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_center/gs_center.dart';
import 'package:gluestack_flutter_pro/widgets/gs_hstack/gs_hstack.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:gluestack_flutter_pro/widgets/gs_vstack/gs_vstack.dart';
import 'package:provider/provider.dart';

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        backgroundColor: themeProvider.getThemeData().canvasColor,
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
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 21),
                  child: GSHStack(
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
