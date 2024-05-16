import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_content_style.dart';

class GSAlertDialogContent extends StatelessWidget {
  final GSAlertDialogHeader? header;
  final GSAlertDialogBody? body;
  final GSAlertDialogFooter? footer;
  final GSStyle? style;
  const GSAlertDialogContent(
      {super.key, this.header, this.body, this.footer, this.style});

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [alertDialogContentStyle],
      inlineStyle: style,
      isFirst: true,
    );
    return Container(
      color: styler.bg?.getColor(context),
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
