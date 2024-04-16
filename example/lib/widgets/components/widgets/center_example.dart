import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class CenterExample extends StatelessWidget {
  const CenterExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
        GSCenter(
              style: GlueStyle(
                alignItems: GSAlignments.end,
                justifyContent: GSAlignments.start,
                height: 150,
                bg: Colors.pink,
                md: GlueStyle(bg: Colors.yellow, dark: GlueStyle(bg: Colors.orange)),
              ),
              child: const GSCenter(child: Text('Testing Center Widget')),
         )
  ''';
    return CustomGSLayout(
      title: "Center",
      style: GlueStyle(
        dark: GlueStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSCenter(
          style: GlueStyle(
            alignItems: GSAlignments.end,
            justifyContent: GSAlignments.start,
            height: 150,
            bg: Colors.pink,
            md: GlueStyle(
                bg: Colors.yellow, dark: GlueStyle(bg: Colors.orange)),
          ),
          child: const GSCenter(child: Text('Testing Center Widget')),
        ),
      ),
    );
  }
}
