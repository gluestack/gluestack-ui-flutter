import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

/// GSBadgeText is a Flutter widget that displays a text within a GSBadge widget.
class GSBadgeText extends StatelessWidget {
  // The text to be displayed inside the badge.
  final String text;
  // Style for the badge text. Can be customized using GSStyle.
  final GSStyle? gsStyle;
  // The visual style for the text, such as font size and color.
  final TextStyle? style;
  // The strut style used for vertical layout.
  final StrutStyle? strutStyle;
  // The alignment of the text within the badge.
  final TextAlign? textAlign;
  // The direction of the text.
  final TextDirection? textDirection;
  // Specifies which locale to be used for the text.
  final Locale? locale;
  // Whether the text should be wrapped when it overflows.
  final bool? softWrap;
  // The text overflow behavior.
  final TextOverflow? overflow;
  // The factor by which the font size is scaled.
  final double? textScaleFactor;
  // The maximum number of lines the text can occupy.
  final int? maxLines;
  // A semantic label for the text.
  final String? semanticsLabel;
  // The basis for the calculation of the width of the text.
  final TextWidthBasis? textWidthBasis;
  // The colorto be used  for selection of the text.
  final Color? selectionColor;

  /// Constructor for GSBadgeText widget:
  const GSBadgeText(
    //takes string as input just like inbuilt Text widget from flutter
    String this.text, {
    super.key,
    this.gsStyle,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    // Access the badge provider to retrieve badge related information.
    final value = GSBadgeProvider.of(context);
    // Retrieve font size and text color based on the badge size.
    final fontSize = GSBadgeStyle.textSize[value!.size];
    final textColor = value.iconAndTextColor;
    // Define a default text style with the computed font size and text color.
    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);
    // Merge the default text style with the provided GSStyle or custom style.
    final mergedStyle =
        defaultTextStyle.merge(gsStyle != null ? gsStyle!.textStyle : style);
    // Create a Text widget with the specified text and merged style.
    return Text(
      text,
      style: mergedStyle,
    );
  }
}
