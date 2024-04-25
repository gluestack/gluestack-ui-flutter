import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

class GSMaterialButton extends StatelessWidget {
  final GSButtonActions? action;
  final GSButtonVariants? variant;
  final GSButtonSizes? size;
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
  const GSMaterialButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSButtonActions.primary,
    this.variant = GSButtonVariants.solid,
    this.size = GSButtonSizes.$md,
    this.isDisabled,
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
    final value = GSButtonGroupProvider.of(context);
    final buttonAction = action?.toGSAction ?? buttonStyle.props?.action;
    final buttonVariant = variant?.toGSVariant ?? buttonStyle.props?.variant;
    final buttonSize = size?.toGSSize ?? value?.size ?? buttonStyle.props?.size;
    final disabled = isDisabled ?? value?.isDisabled ?? false;
    final focused = isFocusVisible ?? false;
    final isAttached = value?.isAttached ?? false;

    return GSStyleBuilder(
      isDisabled: disabled,
      isFocused: focused,
      child: Builder(builder: (context) {
        GSStyle styler = resolveStyles(
            context: context,
            styles: [
              buttonStyle,
              buttonStyle.actionMap(buttonAction),
              buttonStyle.variantMap(buttonVariant),
              buttonStyle.sizeMap(buttonSize),
              buttonStyle
                  .compoundVariants?[action.toString() + variant.toString()]
            ],
            inlineStyle: style,
            isFirst: true);

        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: GSButtonProvider(
            action: buttonAction!,
            variant: buttonVariant!,
            size: buttonSize!,
            child: Opacity(
              opacity: disabled ? styler.opacity ?? 0.5 : 1,
              child: SizedBox(
                height: styler.height,
                child: ElevatedButton(
                  onPressed: disabled ? null : onPressed,
                  onLongPress: disabled ? null : onLongPress,
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
                    backgroundColor: MaterialStatePropertyAll(styler.bg),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(styler.borderRadius ?? 0.0),
                        // side: resolveBorderSide(currentState),
                        side: _resolveBorderSide(
                            buttonVariant, styler, isAttached),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      child,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  BorderSide _resolveBorderSide(
      GSVariants variant, GSStyle styler, bool isAttached) {
    if (isAttached) {
      return BorderSide.none;
    }
    if (variant == GSVariants.link) {
      return BorderSide.none;
    }
    if (isFocusVisible!) {
      return BorderSide(color: $GSColors.primary500, width: 2.0);
    }
    return styler.borderWidth != null || styler.outlineWidth != null
        ? BorderSide(
            color:
                styler.borderColor ?? styler.outlineColor ?? Colors.transparent,
            width: styler.borderWidth ?? styler.outlineWidth ?? 0.0)
        : BorderSide.none;
  }
}
