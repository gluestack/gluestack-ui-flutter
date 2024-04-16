import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGSLayout(
      title: "Divider",
      style: GlueStyle(
        dark: GlueStyle(bg: $GSColors.black),
      ),
      body: GSCenter(
        child: GSVStack(
          children: [
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GlueStyle(bg: Colors.black, height: 30),
            ),
            GSDivider(
              style: GlueStyle(
                bg: Colors.blue,
              ),
            ),
            GSDivider(
              orientation: GSOrientations.vertical,
              style: GlueStyle(
                height: 200,
                bg: Colors.red,
              ),
            ),
            GSDivider(
              style: GlueStyle(
                bg: Colors.orange,
              ),
            ),
            GSBox(
              style: GlueStyle(
                padding: const EdgeInsets.only(bottom: 2),
              ),
              child: const Text('GS Divider'),
            ),
            GSDivider(
              style: GlueStyle(
                bg: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
