import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class TextExample extends StatelessWidget {
  const TextExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
          GSText(
              text: 'This is an example of a simple text.',
              style: GSStyle(
                textStyle: const TextStyle(letterSpacing: \$GSLetterSpacing.\$lg),
              ),
           )
  ''';
    return CustomGSLayout(
      title: "Text",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: Center(
        child: GSBox(
          style: GSStyle(
            dark: GSStyle(bg: $GSColors.black),
          ),
          child: BaseLayout(
            code: code,
            component: GSText(
              text: 'This is an example of a simple text.',
              // bold: true,
              // underline: true,
              style: GSStyle(
                textStyle: TextStyle(letterSpacing: $GSLetterSpacing.$lg),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
