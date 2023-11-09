import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';

/// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget.
class GSBadgeIcon extends StatelessWidget {
  final IconData iconData; // The icon data to display in the widget.
  final GSStyle? style;

  /// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget. Following is the constructor for the same:
  const GSBadgeIcon({
    super.key,
    required this.iconData,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    /// Get the badge provider from the context
    final value = GSBadgeProvider.of(context);

    /// Calculating the font size for the icon based on the text size.
    final fontSize = GSBadgeStyle.textSize[value!.size];

    /// Get the icon color from the badge provider, which may be associated with the badge.
    final badgeIconStyle = value.iconStyle;
    final badgeAction = value.action;
    final badgeVariant = value.variant;
    final badgeSize = value.size;

    // Resolve the style for the badge icon
    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSBadgeStyle.gsBadgeCombination[badgeAction]![badgeVariant],
      size: GSBadgeStyle.size[badgeSize],
      inlineStyle: badgeIconStyle,
    )!;

    styler.merge(style);

    // Create an Icon widget with the given icon data, color, and font size.
    return Icon(
      iconData,
      color: styler.color ?? styler.textStyle?.color,
      size: fontSize,
    );
  }
}
