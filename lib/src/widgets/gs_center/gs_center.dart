import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';

class GSCenter extends StatelessWidget {
  final GSStyle? style;
  final Widget child;

  const GSCenter({super.key, required this.child, this.style});

  @override
  Widget build(BuildContext context) {
    // Resolve the style GS center widget.
    GSStyle styler = resolveStyles(
      context: context,
      styles: [GSStyle()],
      inlineStyle: style,
      isFirst: true,
    );

    final x = resolveAlignment(styler.alignItems),
        y = resolveAlignment(styler.justifyContent);

    return Container(
      decoration: BoxDecoration(color: styler.bg ?? styler.color),
      height: style?.height,
      width: style?.width,
      child: Align(
        alignment: Alignment(x, y),
        child: child,
      ),
    );
  }
}
