import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_group_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder.dart';
import 'package:gluestack_ui/src/widgets/gs_style_builder/gs_style_builder_provider.dart';

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
  final Function? onHover;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Clip clipBehavior;

  const GSButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.action = GSActions.primary,
    this.variant = GSVariants.solid,
    this.size = GSSizes.$md,
    this.isDisabled,
    this.isFocusVisible = false,
    this.style,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autoFocus = false,
    this.clipBehavior = Clip.none,
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
              child: Semantics(
                label: 'Button',
                child: SizedBox(
                  height: styler.height,
                  child: FocusableActionDetector(
                    onFocusChange: onFocusChange,
                    focusNode: focusNode,
                    autofocus: autoFocus,
                    child: GestureDetector(
                      onTap: disabled ? null : onPressed,
                      onLongPress: disabled ? null : onLongPress,
                      child: Container(
                        clipBehavior: clipBehavior,
                        // statesController: statesController,
                        padding: styler.padding,
                        decoration: BoxDecoration(
                          color: GSStyleBuilderProvider.of(context)
                                      ?.isFocused ??
                                  false
                              ? HSLColor.fromColor(styler.bg ?? $GSColors.black)
                                  .withLightness(0.45)
                                  .toColor()
                              : styler.bg,
                          borderRadius:
                              BorderRadius.circular(styler.borderRadius ?? 0.0),
                          border: Border.fromBorderSide(_resolveBorderSide(
                              buttonVariant, styler, isAttached)),
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
