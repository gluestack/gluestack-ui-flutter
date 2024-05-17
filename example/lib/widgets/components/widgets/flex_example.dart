import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/base_layout.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class FlexExample extends StatelessWidget {
  const FlexExample({super.key});

  @override
  Widget build(BuildContext context) {
    var code = '''
        GSFlex(
            style: GSStyle(
              direction: Axis.vertical,
              md: GSStyle(direction: Axis.horizontal),
            ),
            children: [
              GSBox(
                style: GSStyle(
                  height: 150,
                  width: 150,
                  bg: Colors.red,
                ),
              ),
              GSBox(
                style: GSStyle(
                  height: 150,
                  width: 150,
                  bg: Colors.green,
                ),
              ),
              GSBox(
                style: GSStyle(
                  height: 150,
                  width: 150,
                  bg: Colors.blue,
                ),
              ),
            ],
        )
  ''';
    return CustomGSLayout(
      title: "Flex",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
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
                bg: Colors.red,
              ),
            ),
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                bg: Colors.green,
              ),
            ),
            GSBox(
              style: GSStyle(
                height: 150,
                width: 150,
                bg: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
