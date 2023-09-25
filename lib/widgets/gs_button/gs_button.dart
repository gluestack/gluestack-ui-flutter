import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';

class GSButton extends StatelessWidget {
  final GSButtonAction? action;
  final GSButtonVariant? variant;
  final GSButtonSize? size;
  final Widget child;
  final VoidCallback onPressed;

  const GSButton({
    super.key,
    this.action,
    this.variant,
    required this.child,
    required this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final buttonAction = GSButtonAttributes.gsButtonCombination[action] != null
        ? action
        : GSButtonAction.primary;

    final buttonVariant =
        GSButtonAttributes.gsButtonCombination[buttonAction]![variant] != null
            ? variant
            : GSButtonVariant.solid;

    final buttonStyle =
        GSButtonAttributes.gsButtonCombination[buttonAction]![buttonVariant];

    final buttonSize = size ?? GSButtonSize.md;

    return GSButtonProvider(
        action: buttonAction!,
        variant: buttonVariant!,
        size: buttonSize,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: GSButtonAttributes.buttonPaddings[buttonSize],
            backgroundColor: buttonStyle!.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: GSButtonAttributes.buttonBorderRadius[buttonSize]!,
              side: BorderSide(
                color: buttonStyle.borderColor!,
                width: 1.0,
              ),
            ),
          ),
          child: child,
        ));
  }
}
