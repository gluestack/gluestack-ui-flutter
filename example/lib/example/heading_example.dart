import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''GSHeading(
            text: 'I am a Heading',
            style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
          )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heading"),
      ),
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
