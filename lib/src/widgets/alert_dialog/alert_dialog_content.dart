import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/alert_dialog/alert_dialog_body.dart';
import 'package:gluestack_ui/src/widgets/alert_dialog/alert_dialog_content_style.dart';
import 'package:gluestack_ui/src/widgets/alert_dialog/alert_dialog_footer.dart';
import 'package:gluestack_ui/src/widgets/alert_dialog/alert_dialog_header.dart';

class AlertDialogContent extends StatelessWidget {
  final AlertDialogHeader? header;
  final AlertDialogBody? body;
  final AlertDialogFooter? footer;
  final GSStyle? style;
  const AlertDialogContent(
      {super.key, this.header, this.body, this.footer, this.style});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: alertDialogContentStyle,
      inlineStyle: style,
    )!;
    return Container(
      color: styler.bg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header ?? const SizedBox(),
          body ?? const SizedBox(),
          footer ?? const SizedBox(),
        ],
      ),
    );
  }
}
