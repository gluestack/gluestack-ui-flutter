import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_icon_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';

/// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget.
class GSBadgeIcon extends StatelessWidget {
  final IconData iconData; // The icon data to display in the widget.
  final GSSizes? iconSize;
  final GSStyle? style;
  final double? fill;
  final double? grade;
  final double? opticalSize;
  final double? weight;
  final String? semanticLabel;
  final List<Shadow>? shadows;
  final TextDirection? textDirection;

  /// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget. Following is the constructor for the same:
  const GSBadgeIcon(
      {super.key,
      required this.iconData,
      this.iconSize,
      this.style,
      this.fill,
      this.grade,
      this.opticalSize,
      this.weight,
      this.semanticLabel,
      this.shadows,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    final gsBadgeProvider = GSBadgeProvider.of(context);

    /// Get the badge provider from the context
    final ancestorIconStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsBadgeIconStyle.ancestorStyle.first];

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(color: ancestorIconStyles?.color),
      inlineStyle: style,
    )!;
    print("== styler icon size : ${styler.iconSize}");
    print("++ styler icon size : ${gsBadgeProvider?.iconSize}");
    // Create an Icon widget with the given icon data, color, and font size.
    return Icon(
      iconData,
      color: styler.color,
      size: styler.iconSize ?? gsBadgeProvider?.iconSize,
      fill: fill,
      grade: grade,
      opticalSize: opticalSize,
      weight: weight,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
      shadows: shadows,
    );
  }
}
