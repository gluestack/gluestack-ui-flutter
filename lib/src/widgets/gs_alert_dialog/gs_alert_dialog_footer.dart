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
    return Builder(builder: (context) {
      GSConfigStyle styler = resolveStyles(
        context: context,
        styles: [alertDialogFooterStyle],
        inlineStyle: style,
        isFirst: true,
      );
      final x = resolveAlignment(styler.justifyContent);
      final alignment = resolveAlignmentFromNum(x);
      return Container(
        color: styler.bg?.getColor(context),
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
    });
  }
}
