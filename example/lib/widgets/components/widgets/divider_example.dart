import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui_example/widgets/components/layout/custom_gs_layout.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomGSLayout(
      title: "Divider",
      style: GSStyle(
        dark: GSStyle(bg: $GSColors.black),
      ),
      body: GSBox(
        style: GSStyle(
          dark: GSStyle(bg: $GSColors.black),
        ),
        child: GSCenter(
          child: GSVStack(
            children: [
              GSDivider(
                orientation: GSOrientations.vertical,
                style: GSStyle(bg: Colors.black, height: 30),
              ),
              GSDivider(
                style: GSStyle(
                  bg: Colors.blue,
                ),
              ),
              GSDivider(
                orientation: GSOrientations.vertical,
                style: GSStyle(
                  height: 200,
                  bg: Colors.red,
                ),
              ),
              GSDivider(
                style: GSStyle(
                  bg: Colors.orange,
                ),
              ),
              GSBox(
                style: GSStyle(
                  padding: const EdgeInsets.only(bottom: 2),
                ),
                child: const Text('GS Divider'),
              ),
              GSDivider(
                style: GSStyle(
                  bg: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
