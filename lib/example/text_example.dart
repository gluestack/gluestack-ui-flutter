import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/utils/base_layout.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text.dart';
import 'package:provider/provider.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var code = '''GSText(
            text: 'test 1',
            bold: true,
            underline: true,
            style: GSStyle(
              textStyle: const TextStyle(letterSpacing: \$GSLetterSpacing.\$lg),
            ),
          )
  ''';
    return Scaffold(
      backgroundColor: themeProvider.getThemeData().canvasColor,
      appBar: AppBar(),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSText(
            text: 'test 1',
            bold: true,
            underline: true,
            style: GSStyle(
              textStyle: const TextStyle(letterSpacing: $GSLetterSpacing.$lg),
            ),
          ),
        ),
      ),
    );
  }
}
