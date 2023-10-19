import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_token.dart';

class GSButton extends StatelessWidget {
  final GSButtonAction? action;
  final GSButtonVariant? variant;
  final GSButtonSize? size;
  final Widget child;
  final VoidCallback onPressed;
  final GSGeneratedStyle? style;
  final VoidCallback? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;
  const GSButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSButtonAction.primary,
    this.variant = GSButtonVariant.solid,
    this.size = GSButtonSize.md,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
  });

  @override
  Widget build(BuildContext context) {
    GSGeneratedStyle styler = styleResolver(context,
        variantStyle: GSButtonStyle.gsButtonCombination[action]![variant],
        size: GSButtonStyle.size[size]!,
        inlineStyle: style);

    return GSButtonProvider(
      action: action!,
      variant: variant!,
      size: size!,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autoFocus,
        clipBehavior: clipBehavior,
        statesController: statesController,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: styler.padding,
          backgroundColor: styler.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(styler.borderRadius!),
            side: BorderSide(
              color: styler.borderColor!,
              width: styler.borderWidth!,
            ),
          ),
        ),
        child: child,
      ),
    );

    // return GSButtonProvider(
    //     action: action!,
    //     variant: variant!,
    //     size: size!,
    //     child: ElevatedButton(
    //       onPressed: onPressed,
    //       onLongPress: onLongPress,
    //       onHover: onHover,
    //       onFocusChange: onFocusChange,
    //       focusNode: focusNode,
    //       autofocus: autoFocus,
    //       clipBehavior: clipBehavior,
    //       statesController: statesController,
    //       style: ElevatedButton.styleFrom(
    //         elevation: 0,
    //         padding: style != null
    //             ? style!.padding ?? GSButtonAttributes.buttonPaddings[size]
    //             : GSButtonAttributes.buttonPaddings[size],
    //         backgroundColor: style != null
    //             ? style!.color ?? buttonStyle!.bgColor
    //             : buttonStyle!.bgColor,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: style != null
    //               ? style!.borderRadius != null
    //                   ? BorderRadius.circular(style!.borderRadius!)
    //                   : GSButtonAttributes.buttonBorderRadius[size]!
    //               : GSButtonAttributes.buttonBorderRadius[size]!,
    //           side: BorderSide(
    //             color: style != null
    //                 ? style!.borderColor ?? buttonStyle!.borderColor!
    //                 : buttonStyle!.borderColor!,
    //             width: style != null ? style!.borderWidth ?? 1.0 : 1.0,
    //           ),
    //         ),
    //       ),
    //       child: child,
    //     ));
  }
}
