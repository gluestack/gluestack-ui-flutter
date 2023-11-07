import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GSButton(
              action: GSActions.negative,
              variant: GSVariants.solid,
              size: GSSizes.$lg,
              onPressed: () {},
              style: GSStyle(
                web: GSStyle(
                  bg: $GSColors.amber600,
                ),
                ios: GSStyle(
                  bg: $GSColors.pink600,
                ),
                onHover: GSStyle(
                  bg: $GSColors.green400,
                ),
                md: GSStyle(
                  bg: $GSColors.pink400,
                ),
              ),
              child: const GSButtonText(text: "Click Here"),
            ),
            GSButtonGroup(
              reversed: true,
              isAttached: false,
              direction: GSDirection.row,
              size: GSSizes.$md,
              space: GSSpaces.$xl,
              style: GSStyle(
                  // bg: $GSColors.green500,
                  // height: 200,
                  ),
              buttons: [
                GSButton(
                  onPressed: () {},
                  isDisabled: false,
                  action: GSActions.negative,
                  style: GSStyle(
                    onHover: GSStyle(
                      bg: $GSColors.amber300,
                    ),
                  ),
                  child: const GSButtonText(text: "Click Here"),
                ),
                GSButton(
                  child: const GSButtonText(text: "Click Here"),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
