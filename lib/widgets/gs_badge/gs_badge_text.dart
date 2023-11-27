import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_text_style.dart';

/// GSBadgeText is a Flutter widget that displays a text within a GSBadge widget.
class GSBadgeText extends StatelessWidget {
  // The text to be displayed inside the badge.
  final String text;
  // Style for the badge text. Can be customized using GSStyle.
  final GSStyle? style;

  /// Constructor for GSBadgeText widget:
  const GSBadgeText(
    //takes string as input just like inbuilt Text widget from flutter
    String this.text, {
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
        fontWeight: ancestorTextStyles?.fontWeight);

    // Merge default text style with the provided style.
    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);

    // Create a Text widget with the specified text and merged style.
    return Text(
      text,
      style: mergedStyle,
    );
  }
}
