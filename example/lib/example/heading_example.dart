import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import '../widgets/components/layout/base_layout.dart';

class HeadingExample extends StatelessWidget {
  const HeadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
        GSHeading(
              text: 'This is an example for a Heading',
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
            text: 'This is an example for a Heading',
            style: GSStyle(textStyle: const TextStyle(letterSpacing: 2)),
          ),
        ),
      ),
    );
  }
}
