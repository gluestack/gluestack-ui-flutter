import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/alert_dialog_header_style.dart';

class AlertDialogHeader extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const AlertDialogHeader({super.key, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: alertDialogHeaderStyle,
      inlineStyle: style,
    )!;
    final y = resolveAlignment(styler.alignItems),
        x = resolveAlignment(styler.justifyContent);
    return Container(
      color: styler.bg,
      alignment: Alignment(x, y),
      padding: styler.padding,
      height: styler.height,
      width: styler.width ?? double.infinity,
      child: child,
    );
  }
}
