import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_icon_style.dart';

/// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget.
class GSBadgeIcon extends StatelessWidget {
  // The icon data to display in the widget.
  final IconData iconData;

  /// The size of the icon, accepts [GSSizes].
  final GSSizes? iconSize;
  // Custom style for the icon.
  final GSStyle? style;
  // Fill color for the icon.
  final double? fill;
  // Grade of the icon.
  final double? grade;
  // Optical size of the icon.
  final double? opticalSize;
  // Weight of the icon.
  final double? weight;
  // Semantic label for accessibility.
  final String? semanticLabel;
  // List of shadows for the icon.
  final List<Shadow>? shadows;
  // Text direction for the icon.
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
    // Access ancestor provider to retrieve ancestor icon styles.
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsBadgeIconStyle.ancestorStyle.first];
    final size = GSButtonIconStyle
        .size[iconSize ?? GSBadgeProvider.of(context)?.iconSize];
    // Resolve styles for the icon using the context and provided styles.
    final styler = resolveStyles(
      context: context,
      styles: [
        badgeIconStyle,
        badgeIconStyle.sizeMap(ancestorStyles?.props?.size),
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    // Create an Icon widget with the given icon data, color, font size, etc.
    return Icon(
      iconData,
      color: styler.color,
      size: size,
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
