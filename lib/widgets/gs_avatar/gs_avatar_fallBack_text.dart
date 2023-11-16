import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_fallBack_text_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_provider.dart';

/// GSAvatarFallBackText is a Flutter widget that displays a text within a GSBadge widget.
class GSAvatarFallBackText extends StatelessWidget {
  // The text to be displayed inside the GS Avatar.
  final String text;
  // Style for the  GS Avatar text. Can be customized using GSStyle.
  final GSStyle? style;

  final bool isTruncated;
  final bool bold;
  final bool italic;
  final bool underline;
  final bool strikeThrough;
  final bool highlight;
  final Locale? locale;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? selectionColor;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  /// Constructor for GSAvatarFallBackText widget:
  const GSAvatarFallBackText(
      //takes string as input just like inbuilt Text widget from flutter
      String this.text,
      {super.key,
      this.style,
      this.locale,
      this.maxLines,
      this.overflow,
      this.selectionColor,
      this.semanticsLabel,
      this.softWrap,
      this.strutStyle,
      this.textAlign,
      this.textDirection,
      this.textHeightBehavior,
      this.textScaleFactor,
      this.textWidthBasis,
      this.bold = false,
      this.highlight = false,
      this.isTruncated = false,
      this.italic = false,
      this.strikeThrough = false,
      this.underline = false});

  @override
  Widget build(BuildContext context) {
    // Access the  GS Avatar provider to retrieve  GS Avatar related information.
    final value = GSAvatarProvider.of(context);

    // Define a base text style.
    final baseTextStyle =
        avatarFallBackStyle.textStyle?.merge(value?.textStyle);

    // Merge the default text style with the provided GSStyle or custom style.
    final mergedStyle = baseTextStyle?.merge(style?.textStyle);

    // Create a Text widget with the specified text and merged style.
    //TODO: handle decendent style overwrite for text transform
    return Text(
      avatarFallBackStyle.textTransform == null
          ? text
          : avatarFallBackStyle.textTransform == GSTextTransform.uppercase
              ? text.toUpperCase()
              : text.toLowerCase(),
      style: mergedStyle,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
