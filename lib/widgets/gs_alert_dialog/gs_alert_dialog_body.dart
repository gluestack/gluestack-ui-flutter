import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_body_style.dart';

class GSAlertDialogBody extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const GSAlertDialogBody({super.key, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: alertDialogBodyStyle,
      inlineStyle: style,
    )!;

    return Container(
      color: styler.bg,
      padding: styler.padding,
      height: styler.height,
      width: styler.width ?? double.infinity,
      child: child,
    );
  }
}
