import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_badge/gs_badge_text_style.dart';

/// GSBadgeText is a Flutter widget that displays a text within a GSBadge widget.
class GSBadgeText extends StatelessWidget {
  // The text to be displayed inside the badge.
  final String text;
  // Style for the badge text. Can be customized using GSStyle.
  final GSStyle? style;

  /// Constructor for GSBadgeText widget:
  const GSBadgeText(
    //takes string as input just like inbuilt Text widget from flutter
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    // Access the ancestor provider to retrieve ancestor text styles.
    final GSStyle? ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsBadgeTextConfig.ancestorStyle.first];

    // Define default text style based on badge provider and ancestor text styles.
    var defaultTextStyle = TextStyle(
        fontSize: ancestorTextStyles?.textStyle?.fontSize,
        color: ancestorTextStyles?.color,
        fontWeight: ancestorTextStyles?.textStyle?.fontWeight);

    // Merge default text style with the provided style.
    final mergedStyle = defaultTextStyle.merge(style?.textStyle);

    // Create a Text widget with the specified text and merged style.
    return GSText(
      style: GSStyle(textStyle: mergedStyle),
      text: text,
    );
  }
}
