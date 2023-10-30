import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

class GSButton extends StatelessWidget {
  final GSActions? action;
  final GSVariants? variant;
  final GSSizes? size;
  final bool? isDisabled;
  final bool? isFocusVisible;
  final Widget child;
  final VoidCallback onPressed;
  final GSStyle? style;
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
    this.action,
    this.variant,
    this.size,
    this.isDisabled = false,
    this.isFocusVisible = false,
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
    final buttonAction = action ?? buttonStyle.props?.action;
    final buttonVariant = variant ?? buttonStyle.props?.variant;
    final buttonSize = size ?? buttonStyle.props?.size;
    GSStyle styler = resolveStyles(
      context,
      variantStyle:
          GSButtonStyle.gsButtonCombination[buttonAction]![buttonVariant],
      size: GSButtonStyle.size[buttonSize]!,
      inlineStyle: style,
    )!;

    return GSButtonProvider(
      action: buttonAction!,
      variant: buttonVariant!,
      size: buttonSize!,
      child: Opacity(
        opacity: isDisabled! ? styler.opacity! : 1,
        child: SizedBox(
          height: styler.height,
          child: ElevatedButton(
            onPressed: isDisabled! ? null : onPressed,
            onLongPress: isDisabled! ? null : onLongPress,
            onHover: onHover,
            onFocusChange: onFocusChange,
            focusNode: focusNode,
            autofocus: autoFocus,
            clipBehavior: clipBehavior,
            statesController: statesController,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all<double?>(0),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                  styler.padding),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return styler.onActive?.bg ?? styler.bg;
                  } else if (states.contains(MaterialState.hovered)) {
                    return styler.onHover?.bg ?? styler.bg;
                  } else if (states.contains(MaterialState.focused)) {
                    return styler.onFocus?.bg ?? styler.bg;
                  } else if (states.contains(MaterialState.disabled) ||
                      isDisabled!) {
                    return styler.onDisabled?.bg ?? styler.bg;
                  } else if (states.contains(MaterialState.error)) {
                    return styler.onInvaild?.bg ?? styler.bg;
                  }

                  return styler.bg!;
                },
              ),
              shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          styler.onActive?.borderRadius ??
                              styler.borderRadius!),
                      side: isFocusVisible!
                          ? const BorderSide(
                              color: $GSColors.primary500,
                              width: 2.0,
                            )
                          : variant == GSVariants.link
                              ? BorderSide.none
                              : BorderSide(
                                  color: styler.onActive?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onActive?.borderWidth ?? 1.0,
                                ),
                    );
                  } else if (states.contains(MaterialState.hovered)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          styler.onHover?.borderRadius ?? styler.borderRadius!),
                      side: isFocusVisible!
                          ? const BorderSide(
                              color: $GSColors.primary500,
                              width: 2.0,
                            )
                          : variant == GSVariants.link
                              ? BorderSide.none
                              : BorderSide(
                                  color: styler.onHover?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onHover?.borderWidth ?? 1.0,
                                ),
                    );
                  } else if (states.contains(MaterialState.focused)) {
                    // print("INSIDE FOCUS!!     ${styler.onFocus!.bg}");
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          styler.onFocus?.borderRadius ?? styler.borderRadius!),
                      side: isFocusVisible!
                          ? const BorderSide(
                              color: $GSColors.primary500,
                              width: 2.0,
                            )
                          : variant == GSVariants.link
                              ? BorderSide.none
                              : BorderSide(
                                  color: styler.onFocus?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onFocus?.borderWidth ?? 1.0,
                                ),
                    );
                  } else if (states.contains(MaterialState.disabled) ||
                      isDisabled!) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          styler.onDisabled?.borderRadius ??
                              styler.borderRadius!),
                      side: isFocusVisible!
                          ? const BorderSide(
                              color: $GSColors.primary500,
                              width: 2.0,
                            )
                          : variant == GSVariants.link
                              ? BorderSide.none
                              : BorderSide(
                                  color: styler.onDisabled?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onDisabled?.borderWidth ?? 1.0,
                                ),
                    );
                  } else if (states.contains(MaterialState.error)) {
                    return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          styler.onInvaild?.borderRadius ??
                              styler.borderRadius!),
                      side: isFocusVisible!
                          ? const BorderSide(
                              color: $GSColors.primary500,
                              width: 2.0,
                            )
                          : variant == GSVariants.link
                              ? BorderSide.none
                              : BorderSide(
                                  color: styler.onInvaild?.borderColor ??
                                      styler.borderColor!,
                                  width: styler.onInvaild?.borderWidth ?? 1.0,
                                ),
                    );
                  }

                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(styler.borderRadius!),
                    side: isFocusVisible!
                        ? const BorderSide(
                            color: $GSColors.primary500,
                            width: 2.0,
                          )
                        : variant == GSVariants.link
                            ? BorderSide.none
                            : BorderSide(
                                color: styler.borderColor!,
                                width: styler.borderWidth ?? 1.0,
                              ),
                  );
                },
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
