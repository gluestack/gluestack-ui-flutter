import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';

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
    // Access the badge provider to retrieve badge related information.
    final value = GSBadgeProvider.of(context);
    // Retrieve font size and text color based on the badge size.
    final fontSize = GSBadgeStyle.textSize[value!.size];
    final textColor = GSBadgeStyle
        .gsBadgeCombination[value.action]?[value.variant]?.textStyle?.color;

    // Define a default text style with the computed font size and text color.
    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);
    // Merge the default text style with the provided GSStyle or custom style.
    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);
    
    // Create a Text widget with the specified text and merged style.
    return Text(
      text,
      style: mergedStyle,
    );
  }
}
