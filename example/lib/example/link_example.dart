import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:provider/provider.dart';

class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var code = '''GSLink(
            style: GSStyle(),
            url: 'https://gluestack.io/',
            text: const GSLinkText(text: 'gluestack'),
          ),
  ''';
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSLink(
            style: GSStyle(),
            url: 'https://gluestack.io/',
            text: const GSLinkText(text: 'gluestack'),
          ),
        ),
      ),
    );
  }
}
