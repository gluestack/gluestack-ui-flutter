import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_style.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    final toastAction = action ?? toastStyle.props?.action;
    final toastVariant = variant ?? toastStyle.props?.variant;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSToastStyle.gsToastCombination[toastAction]![toastVariant],
      inlineStyle: style,
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

    return Container(
      padding: styler.padding,
      // alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: styler.bg,
        border: border,
        borderRadius: BorderRadius.circular(styler.borderRadius!),
      ),
      child: child,
    );
  }
}
