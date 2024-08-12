import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_body_style.dart';

class GSModalBody extends StatelessWidget {
  final Widget? child;
  final GSStyle? style;
  const GSModalBody({super.key, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [gsModalBodyStyle],
      inlineStyle: style,
      isFirst: true,
    );
    return Container(
      color: styler.bg?.getColor(context),
      padding: styler.padding,
      height: styler.height,
      width: styler.width ?? double.infinity,
      child: child,
    );
  }
}
