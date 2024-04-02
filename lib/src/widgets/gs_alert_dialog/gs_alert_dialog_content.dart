import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_body.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_content_style.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_footer.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_header.dart';

import '../../provider/provider.dart';

class GSAlertDialogContent extends StatelessWidget {
  final GSAlertDialogHeader? header;
  final GSAlertDialogBody? body;
  final GSAlertDialogFooter? footer;
  final GSStyle? style;
  const GSAlertDialogContent(
      {super.key, this.header, this.body, this.footer, this.style});

  @override
  Widget build(BuildContext context) {
    alertDialogContentStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().alertDialogContent);
    GSStyle styler = resolveStyles(
      context: context,
      styles: [alertDialogContentStyle],
      inlineStyle: style,
      isFirst: true,
    );
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
