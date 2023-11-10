import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/utils/resolver.dart';

class GSCenter extends StatelessWidget {
  final GSStyle? style;
  final Widget child;

  const GSCenter({super.key, required this.child, this.style});

  @override
  Widget build(BuildContext context) {
    // Resolve the style GS center widget.
    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(),
      inlineStyle: style,
    )!;

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
