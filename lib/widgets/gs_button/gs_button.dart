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
    this.action = GSButtonAction.primary,
    this.variant = GSButtonVariant.solid,
    this.size = GSButtonSize.md,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle =
        GSButtonAttributes.gsButtonCombination[action]![variant];

    return GSButtonProvider(
        action: action!,
        variant: variant!,
        size: size!,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: GSButtonAttributes.buttonPaddings[size],
            backgroundColor: buttonStyle!.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: GSButtonAttributes.buttonBorderRadius[size]!,
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
