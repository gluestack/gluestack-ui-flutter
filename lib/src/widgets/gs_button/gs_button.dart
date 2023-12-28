import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';

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
  })  : assert(
          size == null ||
              size == GSSizes.$xs ||
              size == GSSizes.$sm ||
              size == GSSizes.$md ||
              size == GSSizes.$lg,
          'GS Button can only have the sizes: \$lg, \$md \$sm and \$xs\n'
          'To resolve this error, ensure only the above mentioned GSSizes is specified!',
        ),
        assert(
          variant == null ||
              variant == GSVariants.outline ||
              variant == GSVariants.solid ||
              variant == GSVariants.link,
          'GS Button can only have the vairants: solid, outline and link\n'
          'To resolve this error, ensure only the above mentioned GSVariants is specified.',
        ),
        assert(
          action == null ||
              action == GSActions.primary ||
              action == GSActions.secondary ||
              action == GSActions.positive ||
              action == GSActions.negative,
          'GS Button can only have the actions: primary, secondary, positive and negative\n'
          'To resolve this error, ensure only the above mentioned GSActions is specified.',
        );

  @override
  Widget build(BuildContext context) {
    final value = GSButtonGroupProvider.of(context);
    final buttonAction = action ?? buttonStyle.props?.action;
    final buttonVariant = variant ?? buttonStyle.props?.variant;
    final buttonSize = size ?? value?.size ?? buttonStyle.props?.size;
    final disabled = isDisabled ?? value?.isDisabled ?? false;
    final isAttached = value?.isAttached ?? false;

    GSStyle styler = resolveStyles(context,
        variantStyle:
            GSButtonStyle.gsButtonCombination[buttonAction]![buttonVariant],
        size: GSButtonStyle.size[buttonSize],
        inlineStyle: style,
        descendantStyles: GSButtonStyle.buttonDescendantStyles[action]
            ?[variant],
        descendantStyleKeys: gsButtonConfig.descendantStyle)!;
    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GSButtonProvider(
        action: buttonAction!,
        variant: buttonVariant!,
        size: buttonSize!,
        child: Opacity(
          opacity: disabled ? styler.opacity! : 1,
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
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return styler.onActive?.bg ?? styler.bg;
                    } else if (states.contains(MaterialState.hovered)) {
// TODO: Discuss about onHover in dark mode
                      return styler.onHover?.bg ?? styler.bg;
                    } else if (states.contains(MaterialState.focused)) {
                      return styler.onFocus?.bg ?? styler.bg;
                    } else if (states.contains(MaterialState.disabled) ||
                        disabled) {
                      return styler.onDisabled?.bg ?? styler.bg;
                    } else if (states.contains(MaterialState.error)) {
                      return styler.onInvalid?.bg ?? styler.bg;
                    }

                    return styler.bg!;
                  },
                ),
                shape:
                    MaterialStateProperty.resolveWith<RoundedRectangleBorder?>(
                        (Set<MaterialState> states) {
                  double resolveBorderRadius(MaterialState state) {
                    switch (state) {
                      case MaterialState.pressed:
                        return styler.onActive?.borderRadius ??
                            styler.borderRadius ??
                            0;
                      case MaterialState.hovered:
                        return styler.onHover?.borderRadius ??
                            styler.borderRadius ??
                            0;
                      case MaterialState.focused:
                        return styler.onFocus?.borderRadius ??
                            styler.borderRadius ??
                            0;
                      case MaterialState.disabled:
                        return styler.onDisabled?.borderRadius ??
                            styler.borderRadius ??
                            0;
                      case MaterialState.error:
                        return styler.onInvalid?.borderRadius ??
                            styler.borderRadius ??
                            0;
                      default:
                        return styler.borderRadius ?? 0;
                    }
                  }

                  // Common borderSide resolution.
                  BorderSide resolveBorderSide(MaterialState state) {
                    if (isAttached) return BorderSide.none;
                    if (isFocusVisible!) {
                      return BorderSide(
                          color: $GSColors.primary500, width: 2.0);
                    } else if (variant == GSVariants.link) {
                      return BorderSide.none;
                    } else {
                      switch (state) {
                        case MaterialState.pressed:
                          return BorderSide(
                              color: styler.onActive?.borderColor ??
                                  styler.borderColor!,
                              width: styler.onActive?.borderWidth ?? 1.0);
                        case MaterialState.hovered:
                          return BorderSide(
                              color: styler.onHover?.borderColor ??
                                  styler.borderColor!,
                              width: styler.onHover?.borderWidth ?? 1.0);
                        case MaterialState.focused:
                          return BorderSide(
                              color: styler.onFocus?.borderColor ??
                                  styler.borderColor!,
                              width: styler.onFocus?.borderWidth ?? 1.0);
                        case MaterialState.disabled:
                          return BorderSide(
                              color: styler.onDisabled?.borderColor ??
                                  styler.borderColor!,
                              width: styler.onDisabled?.borderWidth ?? 1.0);
                        case MaterialState.error:
                          return BorderSide(
                              color: styler.onInvalid?.borderColor ??
                                  styler.borderColor!,
                              width: styler.onInvalid?.borderWidth ?? 1.0);
                        default:
                          return BorderSide(
                              color: styler.borderColor!,
                              width: styler.borderWidth ?? 1.0);
                      }
                    }
                  }

                  // Identify the current state to apply styles for.
                  MaterialState currentState = MaterialState.values.firstWhere(
                      states.contains,
                      orElse: () => MaterialState.values.last);
                  return RoundedRectangleBorder(
                    borderRadius: isAttached
                        ? BorderRadius.zero
                        : BorderRadius.circular(
                            resolveBorderRadius(currentState)),
                    side: resolveBorderSide(currentState),
                  );
                }),
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
  }
}
