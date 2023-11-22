import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_box/gs_box.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab_label.dart';

class FabExample extends StatelessWidget {
  const FabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Stack(
              children: [
                GSBox(
                  style: GSStyle(
                      height: 360,
                      width: 320,
                      borderRadius: $GSRadii.$md,
                      color: $GSColors.backgroundLight50,
                      dark: GSStyle(color: $GSColors.backgroundDark900)),
                ),
                GSFab(
                  size: GSSizes.$lg,
                  onPressed: () {},
                  icon: const GSFabIcon(icon: Icons.add),
                  label: const GSFabLabel(text: 'Quick Start'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
