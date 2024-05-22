import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_alert_dialog/gs_alert_dialog_header_style.dart';

class GSAlertDialogHeader extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const GSAlertDialogHeader({super.key, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [alertDialogHeaderStyle],
      inlineStyle: style,
      isFirst: true,
    );
    final y = resolveAlignment(styler.alignItems),
        x = resolveAlignment(styler.justifyContent);
    return Container(
      color: styler.bg?.getColor(context),
      alignment: Alignment(x, y),
      padding: styler.padding,
      height: styler.height,
      width: styler.width ?? double.infinity,
      child: child,
    );
  }
}
