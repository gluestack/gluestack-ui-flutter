import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import '../widgets/components/layout/base_layout.dart';

class ScrollExample extends StatelessWidget {
  const ScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
            GSScrollView(
                children: [
                  for (int i = 0; i < 100; i++)
                      GSText(
                          text: 'Child No. \$i',
                          textAlign: TextAlign.center,
                      ),
                ],
            ),
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll"),
      ),
      body: Center(
        child: BaseLayout(
          code: code,
          component: GSBox(
            style: GSStyle(
                height: 250, borderColor: $GSColors.blue400, borderWidth: 2),
            child: GSScrollView(
              children: [
                for (int i = 0; i < 100; i++)
                  GSText(
                    text: 'Widget No. $i',
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
