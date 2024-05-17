import 'package:flutter/gestures.dart';
import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';

class GSButton extends StatelessWidget {
  final GSButtonActions? action;
  final GSButtonVariants? variant;
  final GSButtonSizes? size;
  final String? semanticsLabel;
  final bool? isDisabled;
  final bool? isFocusVisible;
  final Widget child;
  final GSStyle? style;
  final Function? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Clip clipBehavior;

  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final GestureDoubleTapCallback? onDoubleTap;

  const GSButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSButtonActions.primary,
    this.variant = GSButtonVariants.solid,
    this.size = GSButtonSizes.$md,
    this.isDisabled,
    this.semanticsLabel,
    this.isFocusVisible = false,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
    this.onDoubleTap,
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
    final freeSize = context.findAncestorWidgetOfExactType<GSFab>() != null;

    return GSStyleBuilder(
      isDisabled: disabled,
      isFocused: focused,
      child: Builder(builder: (context) {
        GSConfigStyle styler = resolveStyles(
          context: context,
          styles: [
            buttonStyle,
            buttonStyle.actionMap(buttonAction),
            buttonStyle.variantMap(buttonVariant),
            buttonStyle.sizeMap(buttonSize),
            buttonStyle.compoundVariants?[
                buttonAction.toString() + buttonVariant.toString()]
          ],
          inlineStyle: style,
          isFirst: true,
        );

        if (GSStyleBuilderProvider.of(context)?.isHovered ?? false) {
          if (onHover != null && !disabled) {
            onHover!();
          }
        }
        //Hacky Fix TODO: brainstorm this
        if (GSStyleBuilderProvider.of(context)?.isActive ?? false) {
          styler.bg = styler.onActive?.bg;
        }

        BorderSide resolveBorderSide(
            GSVariants variant, GSConfigStyle styler, bool isAttached) {
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
                  color: styler.borderColor?.getColor(context) ??
                      styler.outlineColor?.getColor(context) ??
                      const Color.fromARGB(0, 0, 0, 0),
                  width: styler.borderWidth ?? styler.outlineWidth ?? 0.0)
              : BorderSide.none;
        }

        return GSAncestor(
          decedentStyles: styler.descendantStyles,
          child: GSButtonProvider(
            action: buttonAction!,
            variant: buttonVariant!,
            size: buttonSize!,
            child: Opacity(
              opacity: disabled ? styler.opacity ?? 0.5 : 1,
              child: Semantics(
                label: semanticsLabel ?? 'Button',
                button: true,
                child: GsGestureDetector(
                  onPressed: disabled ? null : onPressed,
                  onDoubleTap: disabled ? null : onDoubleTap,
                  onLongPress: disabled ? null : onLongPress,
                  child: Container(
                    height: freeSize ? null : styler.height,
                    width: freeSize ? null : styler.width,
                    clipBehavior: clipBehavior,
                    padding: styler.padding,
                    decoration: BoxDecoration(
                      color: styler.bg?.getColor(context),
                      borderRadius:
                          BorderRadius.circular(styler.borderRadius ?? 0.0),
                      border: Border.fromBorderSide(
                          resolveBorderSide(buttonVariant, styler, isAttached)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment
                          .center, //TODO: give more control to end user
                      children: [
                        child,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
