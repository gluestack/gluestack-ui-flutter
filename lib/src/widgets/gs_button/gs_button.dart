import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/public.dart';
import 'package:gluestack_ui/src/widgets/gs_gesture_detector/public.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSButtonActions {
  primary,
  secondary,
  positive,
  negative,
}

enum GSButtonVariants {
  solid,
  outline,
  link,
}

enum GSButtonSizes {
  $xs,
  $sm,
  $md,
  $lg,
}

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
        buttonStyle = GSStyle.fromMap(
            data: getIt<GluestackCustomConfig>().button,
            descendantStyle: gsButtonConfig.descendantStyle);

        GSStyle styler = resolveStyles(
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
                      color: styler.bg,
                      borderRadius:
                          BorderRadius.circular(styler.borderRadius ?? 0.0),
                      border: Border.fromBorderSide(_resolveBorderSide(
                          buttonVariant, styler, isAttached)),
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
            color: styler.borderColor ??
                styler.outlineColor ??
                const Color.fromARGB(0, 0, 0, 0),
            width: styler.borderWidth ?? styler.outlineWidth ?? 0.0)
        : BorderSide.none;
  }
}
