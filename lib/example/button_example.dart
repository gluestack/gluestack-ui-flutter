import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_group.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_icon.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_spinner.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_text.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});
  final currentButtonSize = GSSizes.$lg;
  final sizedBoxHeight = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GSButton(
                size: currentButtonSize,
                action: GSActions.primary,
                variant: GSVariants.solid,
                child: const GSButtonText(text: 'button1'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.primary,
                variant: GSVariants.outline,
                child: const GSButtonText(text: 'button2'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.primary,
                variant: GSVariants.link,
                child: const GSButtonText(text: 'button3'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.secondary,
                variant: GSVariants.solid,
                child: const GSButtonText(text: 'button4'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.secondary,
                variant: GSVariants.outline,
                child: const GSButtonText(text: 'button5'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.secondary,
                variant: GSVariants.link,
                child: const GSButtonText(text: 'button6'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.positive,
                variant: GSVariants.solid,
                child: const GSButtonText(text: 'button7'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.positive,
                variant: GSVariants.outline,
                child: const GSButtonText(text: 'button8'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.positive,
                variant: GSVariants.link,
                child: const GSButtonText(text: 'button9'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.negative,
                variant: GSVariants.solid,
                child: const GSButtonText(text: 'button10'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.negative,
                variant: GSVariants.outline,
                child: const GSButtonText(text: 'button11'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              GSButton(
                size: currentButtonSize,
                action: GSActions.negative,
                variant: GSVariants.link,
                child: const GSButtonText(text: 'button13'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              //default button
              GSButton(
                child: const GSButtonText(text: 'button14'),
                onPressed: () {},
              ),
              //button with inline style
              SizedBox(
                height: sizedBoxHeight,
              ),
              //button with inline style
              GSButton(
                style: GSStyle(
                    bg: $GSColors.amber100,
                    borderColor: $GSColors.amber100,
                    height: $GSSpace.$16,
                    dark: GSStyle(bg: $GSColors.blue900)),
                child: const GSButtonText(text: 'button15'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              //button with  variant,action and inline style
              GSButton(
                variant: GSVariants.solid,
                action: GSActions.secondary,
                style: GSStyle(
                    bg: $GSColors.amber100,
                    borderColor: $GSColors.amber100,
                    height: $GSSpace.$16,
                    dark: GSStyle(bg: $GSColors.blue900)),
                child: const GSButtonText(text: 'button16'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              // button with descendant properties overridden
              GSButton(
                variant: GSVariants.solid,
                action: GSActions.secondary,
                style: GSStyle(
                    bg: $GSColors.amber100,
                    borderColor: $GSColors.amber100,
                    height: $GSSpace.$16,
                    descendantStyles: {
                      "_text": GSStyle(color: $GSColors.black)
                    },
                    dark: GSStyle(bg: $GSColors.blue900, descendantStyles: {
                      "_text": GSStyle(color: $GSColors.white)
                    })),
                child: const GSButtonText(text: 'button17'),
                onPressed: () {},
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              //button with all 3 descendants
              GSButton(
                action: GSActions.negative,
                variant: GSVariants.solid,
                size: GSSizes.$lg,
                style: GSStyle(
                    dark: GSStyle(descendantStyles: {
                      "_text": GSStyle(color: $GSColors.black),
                      "_icon": GSStyle(color: $GSColors.pink900),
                      "_spinner": GSStyle(
                          color: $GSColors.yellow900,
                          props:
                              GSProps(style: GSStyle(color: $GSColors.blue900)))
                    }),
                    descendantStyles: {
                      "_text": GSStyle(color: $GSColors.green500),
                    }),
                onPressed: () {},
                // style: GSStyle(
                //   web: GSStyle(
                //     bg: $GSColors.amber600,
                //   ),
                //   ios: GSStyle(
                //     bg: $GSColors.pink600,
                //   ),
                //   onHover: GSStyle(
                //     bg: $GSColors.green400,
                //   ),
                //   md: GSStyle(
                //     bg: $GSColors.pink400,
                //   ),
                // ),
                child: Row(
                  children: [
                    GSButtonIcon(
                      icon: Icons.add,
                      iconSize: GSSizes.$lg,
                      style: GSStyle(
                        color: $GSColors.green600,
                      ),
                    ),
                    GSButtonText(
                      text: "Add",
                      style: GSStyle(
                        textStyle: const TextStyle(
                          color: $GSColors.pink600,
                        ),
                      ),
                    ),
                    GSButtonSpinner(
                      style: GSStyle(
                        height: 15,
                        width: 15,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: sizedBoxHeight,
              ),
              //button group
              GSButtonGroup(
                reversed: true,
                isAttached: false,
                direction: GSDirection.row,
                size: currentButtonSize,
                space: GSSpaces.$xl,
                style: GSStyle(
                    // bg: $GSColors.green500,
                    // height: sizedBoxHeight0,
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
      ),
    );
  }
}
