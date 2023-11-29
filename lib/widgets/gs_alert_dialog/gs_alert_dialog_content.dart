import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_body.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_content_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_footer.dart';
import 'package:gluestack_flutter_pro/widgets/gs_alert_dialog/gs_alert_dialog_header.dart';

class GSAlertDialogContent extends StatelessWidget {
  final GSAlertDialogHeader? header;
  final GSAlertDialogBody? body;
  final GSAlertDialogFooter? footer;
  final GSStyle? style;
  const GSAlertDialogContent(
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
