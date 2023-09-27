import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_attributes.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';
import 'package:gluestack_flutter_pro/widgets/style/style_data.dart';

class GSButton extends StatelessWidget {
  final GSButtonAction? action;
  final GSButtonVariant? variant;
  final GSButtonSize? size;
  final Widget child;
  final VoidCallback onPressed;
  final StyleData? style;
  const GSButton({
    super.key,
    this.action = GSButtonAction.primary,
    this.variant = GSButtonVariant.solid,
    this.size = GSButtonSize.md,
    required this.child,
    required this.onPressed,
    this.style,
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
            padding: style != null
                ? style!.padding ?? GSButtonAttributes.buttonPaddings[size]
                : GSButtonAttributes.buttonPaddings[size],
            backgroundColor: style != null
                ? style!.color ?? buttonStyle!.bgColor
                : buttonStyle!.bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: style != null
                  ? style!.borderRadius != null
                      ? BorderRadius.circular(style!.borderRadius!)
                      : GSButtonAttributes.buttonBorderRadius[size]!
                  : GSButtonAttributes.buttonBorderRadius[size]!,
              side: BorderSide(
                color: style != null
                    ? style!.borderColor ?? buttonStyle!.borderColor!
                    : buttonStyle!.borderColor!,
                width: style != null ? style!.borderWidth ?? 1.0 : 1.0,
              ),
            ),
          ),
          child: child,
        ));
  }
}
