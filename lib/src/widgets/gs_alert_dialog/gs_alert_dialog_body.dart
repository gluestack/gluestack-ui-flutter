import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_body_style.dart';

class GSAlertDialogBody extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const GSAlertDialogBody({super.key, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context: context,
      styles: [alertDialogBodyStyle],
      inlineStyle: style,
      isFirst: true,
    );
    return Container(
      color: styler.bg,
      padding: styler.padding,
      height: styler.height,
      width: styler.width ?? double.infinity,
      child: child,
    );
  }
}
