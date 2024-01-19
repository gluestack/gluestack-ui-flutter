import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_ui/src/widgets/gs_toast/gs_toast_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSToastActions {
  success,
  warning,
  error,
  info,
  attention,
}

enum GSToastVariants {
  solid,
  outline,
  accent,
}

///
/// Gluestack Toast Widget.
///
class GSToast extends StatelessWidget {
  final Widget? child;
  final GSToastActions? action;
  final GSToastVariants? variant;
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
    final toastAction = action?.toGSAction ?? toastStyle.props?.action;
    final toastVariant = variant?.toGSVariant ?? toastStyle.props?.variant;

    GSStyle styler = resolveStylesDeprecated(
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
