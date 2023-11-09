import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';

enum GSAlignItems { start, center, end }

enum GSJustifyContent { start, center, end }

class GSCenter extends StatelessWidget {
  final GSStyle? style;
  final GSAlignItems? alignItems;
  final GSJustifyContent? justifyContent;
  final Widget child;

  const GSCenter(
      {super.key,
      required this.child,
      this.style,
      this.alignItems = GSAlignItems.center,
      this.justifyContent = GSJustifyContent.center});

  @override
  Widget build(BuildContext context) {
    double resolveAlignment<T>(T suppliedAlignment) {
      if (suppliedAlignment == GSJustifyContent.center ||
          suppliedAlignment == GSAlignItems.center) {
        return 0;
      } else if (suppliedAlignment == GSJustifyContent.start ||
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
            resolveAlignment(alignItems), resolveAlignment(justifyContent)),
        child: child,
      ),
    );
  }
}
