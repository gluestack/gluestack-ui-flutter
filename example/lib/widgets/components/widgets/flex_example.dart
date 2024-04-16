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
            style: GlueStyle(
              direction: Axis.vertical,
              md: GlueStyle(direction: Axis.horizontal),
            ),
            children: [
              GSBox(
                style: GlueStyle(
                  height: 150,
                  width: 150,
                  bg: Colors.red,
                ),
              ),
              GSBox(
                style: GlueStyle(
                  height: 150,
                  width: 150,
                  bg: Colors.green,
                ),
              ),
              GSBox(
                style: GlueStyle(
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
      style: GlueStyle(
        dark: GlueStyle(bg: $GSColors.black),
      ),
      body: BaseLayout(
        code: code,
        component: GSFlex(
          style: GlueStyle(
            direction: Axis.vertical,
            md: GlueStyle(direction: Axis.horizontal),
          ),
          children: [
            GSBox(
              style: GlueStyle(
                height: 150,
                width: 150,
                bg: Colors.red,
              ),
            ),
            GSBox(
              style: GlueStyle(
                height: 150,
                width: 150,
                bg: Colors.green,
              ),
            ),
            GSBox(
              style: GlueStyle(
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
