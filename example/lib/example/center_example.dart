import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/base_layout.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = GSTheme.of(context);
    var code = '''
        GSCenter(
              style: GSStyle(
                alignItems: GSAlignments.end,
                justifyContent: GSAlignments.start,
                height: 150,
                bg: Colors.pink,
                md: GSStyle(bg: Colors.yellow, dark: GSStyle(bg: Colors.orange)),
              ),
              child: const GSCenter(child: Text('Testing Center Widget')),
         )
  ''';
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.menuColor,
        title: const GSText(
          text: "Center",
          size: GSSizes.$xl,
        ),
      ),
      body: BaseLayout(
        code: code,
        component: GSCenter(
          style: GSStyle(
            alignItems: GSAlignments.end,
            justifyContent: GSAlignments.start,
            height: 150,
            bg: Colors.pink,
            md: GSStyle(bg: Colors.yellow, dark: GSStyle(bg: Colors.orange)),
          ),
          child: const GSCenter(child: Text('Testing Center Widget')),
        ),
      ),
    );
  }
}
