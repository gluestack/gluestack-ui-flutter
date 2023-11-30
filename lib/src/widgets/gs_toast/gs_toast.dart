import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_toast/gs_toast_style.dart';

class GSToast extends StatelessWidget {
  final Widget? child;
  final GSActions? action;
  final GSVariants? variant;
  final GSStyle? style;
  const GSToast({
    super.key,
    this.child,
    this.action,
    this.variant,
    this.style,
  })  : assert(
          action == null ||
              action == GSActions.success ||
              action == GSActions.warning ||
              action == GSActions.error ||
              action == GSActions.info ||
              action == GSActions.attention,
          'Toast can only have the types: error, warning, success, info and attention!\n'
          'To resolve this error, ensure only the above mentioned GSActions is specified.',
        ),
        assert(
          variant == null ||
              variant == GSVariants.outline ||
              variant == GSVariants.accent ||
              variant == GSVariants.solid,
          'Toast can only have the vairants: solid, accent and outline\n'
          'To resolve this error, ensure only the above mentioned GSVariants is specified.',
        );

  @override
  Widget build(BuildContext context) {
    final toastAction = action ?? toastStyle.props?.action;
    final toastVariant = variant ?? toastStyle.props?.variant;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSToastStyle.gsToastCombination[toastAction]![toastVariant],
      inlineStyle: style,
      descendantStyleKeys: gsToastConfig.descendantStyle,
    )!;
    final border = toastVariant == GSVariants.outline
        ? Border.all(color: styler.borderColor!)
        : toastVariant == GSVariants.accent
            ? Border(
                left: BorderSide(
                  color: styler.borderColor!,
                  width: styler.borderLeftWidth!,
                ),
                right: BorderSide(
                  color: styler.borderColor!,
                  width: 0,
                ),
                top: BorderSide(
                  color: styler.borderColor!,
                  width: 0,
                ),
                bottom: BorderSide(
                  color: styler.borderColor!,
                  width: 0,
                ),
              )
            : null;

    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: Container(
        padding: styler.padding,
        decoration: BoxDecoration(
          color: styler.bg,
          border: border,
          borderRadius: BorderRadius.circular(styler.borderRadius!),
        ),
        child: child,
      ),
    );
  }
}
