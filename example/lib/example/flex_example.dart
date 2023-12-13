import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/utils/base_layout.dart';

class FlexExample extends StatelessWidget {
  const FlexExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''GSFlex(
          style: GSStyle(
            direction: Axis.vertical,
            md: GSStyle(direction: Axis.horizontal),
          ),
          children: [
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                color: Colors.red,
              ),
            ),
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                color: Colors.green,
              ),
            ),
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                color: Colors.blue,
              ),
            ),
          ],
        )
  ''';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flex"),
      ),
      body: BaseLayout(
        code: code,
        component: GSFlex(
          style: GSStyle(
            direction: Axis.vertical,
            md: GSStyle(direction: Axis.horizontal),
          ),
          children: [
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                color: Colors.red,
              ),
            ),
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                color: Colors.green,
              ),
            ),
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
