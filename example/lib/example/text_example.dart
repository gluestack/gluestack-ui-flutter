import 'package:flutter/material.dart' hide Center;
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
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
