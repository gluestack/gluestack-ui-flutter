import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_header_style.dart';

class GSAlertDialogHeader extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const GSAlertDialogHeader({super.key, this.child, this.style});

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
