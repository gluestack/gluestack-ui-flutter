import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
        GSHeading(
              text: 'This is an example for a Heading',
              style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            theme.brightness == Brightness.dark ? $GSColors.trueGray800 : null,
        title: const GSText(
          text: "Heading",
          size: GSSizes.$xl,
        ),
      ),
      body: Center(
        child: GSBox(
          style: GSStyle(
            dark: GSStyle(bg: $GSColors.black),
          ),
          child: BaseLayout(
            code: code,
            component: GSHeading(
              text: 'This is an example for a Heading',
              style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
            ),
          ),
        ),
      ),
    );
  }
}
