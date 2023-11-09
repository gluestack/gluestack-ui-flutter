import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';

class GSCenter extends StatelessWidget {
  final GSStyle? style;
  final Widget child;

  const GSCenter({super.key, required this.child, this.style});

  @override
  Widget build(BuildContext context) {
    double resolveAlignment<T>(T suppliedAlignment) {
      if (suppliedAlignment == 0) return 0;
      if (suppliedAlignment == GSJustifyContents.center ||
          suppliedAlignment == GSAlignItems.center) {
        return 0;
      } else if (suppliedAlignment == GSJustifyContents.start ||
          suppliedAlignment == GSAlignItems.start) {
        return -1;
      } else {
        return 1;
      }
    }

    // Resolve the style for the badge.
    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(),
      inlineStyle: style,
    )!;

    return Container(
      decoration: BoxDecoration(color: styler.bg ?? styler.color),
      height: style?.height,
      width: style?.width,
      child: Align(
        alignment: Alignment(
          resolveAlignment(style?.alignItems != null ? styler.alignItems : 0),
          resolveAlignment(
              style?.justifyContent != null ? styler.justifyContent : 0),
        ),
        child: child,
      ),
    );
  }
}
