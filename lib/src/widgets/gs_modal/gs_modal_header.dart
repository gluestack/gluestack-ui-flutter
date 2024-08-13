import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_header_style.dart';

class GSModalHeader extends StatelessWidget {
  final Widget? child;
  final GSButton? closeButton;
  final GSStyle? style;
  const GSModalHeader({super.key, this.child, this.closeButton, this.style});

  @override
  Widget build(BuildContext context) {
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [gsModalHeaderStyle],
      inlineStyle: style,
    );
    final y = resolveAlignment(styler.alignItems),
        x = resolveAlignment(styler.justifyContent);
    return Row(
      children: [
        Expanded(
          child: Container(
            color: styler.bg?.getColor(context),
            alignment: Alignment(x, y),
            padding: styler.padding,
            height: styler.height,
            width: styler.width ?? double.infinity,
            child: child,
          ),
        ),
        closeButton ?? SizedBox.shrink(),
      ],
    );
  }
}
