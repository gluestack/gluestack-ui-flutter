import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';
import 'package:provider/provider.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var code = '''GSHeading(
            text: 'I am a Heading',
            style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
          )
  ''';
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSHeading(
            text: 'I am a Heading',
            style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
          ),
        ),
      ),
    );
  }
}
