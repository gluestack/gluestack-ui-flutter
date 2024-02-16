import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
          GSLink(
              style: GSStyle(),
              url: 'https://gluestack.io/',
              text: const GSLinkText(text: 'Go to Gluestack'),
          )
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Link"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSLink(
            style: GSStyle(),
            url: 'https://gluestack.io/',
            text: const GSLinkText(text: 'Go to Gluestack'),
          ),
        ),
      ),
    );
  }
}
