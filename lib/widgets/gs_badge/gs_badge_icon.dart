import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';

/// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget.
class GSBadgeIcon extends StatelessWidget {
  final IconData iconData; // The icon data to display in the widget.

  /// This widget represents an icon which is optional with GSBadge widget. It's used to display icons along with text in GSBadge widget. Following is the constructor for the same:
  const GSBadgeIcon({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    /// Get the badge provider from the context
    final value = GSBadgeProvider.of(context);

    // Retrieve icon size and text color based on the text size.
    final iconSize = GSBadgeStyle.textSize[value!.size];
    final iconColor = GSBadgeStyle
        .gsBadgeCombination[value.action]?[value.variant]?.textStyle?.color;

    // Create an Icon widget with the given icon data, color, and font size.
    return Icon(
      iconData,
      color: iconColor,
      size: iconSize,
    );
  }
}
