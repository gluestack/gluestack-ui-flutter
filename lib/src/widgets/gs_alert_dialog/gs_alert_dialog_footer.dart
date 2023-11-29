import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_footer_style.dart';

class GSAlertDialogFooter extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const GSAlertDialogFooter({super.key, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: alertDialogFooterStyle,
      inlineStyle: style,
    )!;
    final x = resolveAlignment(styler.justifyContent);
    final alignment = x == 1
        ? MainAxisAlignment.end
        : x == -1
            ? MainAxisAlignment.start
            : x == 0
                ? MainAxisAlignment.center
                : MainAxisAlignment.end;

    return Container(
      color: styler.bg,
      padding: styler.padding,
      height: styler.height,
      width: styler.width,
      child: Row(
        mainAxisAlignment: alignment,
        children: [
          child ?? const SizedBox(),
        ],
      ),
    );
  }
}
