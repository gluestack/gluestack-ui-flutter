import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_fallBack_text_style.dart';

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
    String shortTextMaker() {
      if (text.isEmpty) {
        return '';
      }

      List<String> words = text.split(' ');

      if (words.length >= 2) {
        return " ${words[0][0]}${words[1][0]}";
      } else {
        return text[0];
      }
    }

    final shortHandText = shortTextMaker().trim();
    if (avatarFallBackStyle.textTransform == GSTextTransform.uppercase) {
      shortHandText.toUpperCase();
    }

    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsAvatarFallbackTextConfig.ancestorStyle.first];

    // Define a base text style.
    final baseTextStyle =
        avatarFallBackStyle.textStyle?.merge(ancestorStyles?.textStyle);

    // Merge the default text style with the provided GSStyle or custom style.
    final mergedStyle =
        baseTextStyle?.merge(style != null ? style!.textStyle : null);

    // Create a Text widget with the specified text and merged style.
    //TODO: handle decendent style overwrite for text transform
    return Text(
      avatarFallBackStyle.textTransform == null || style?.textTransform == null
          ? shortHandText
          : avatarFallBackStyle.textTransform == GSTextTransform.uppercase ||
                  style?.textTransform == GSTextTransform.uppercase
              ? shortHandText.toUpperCase()
              : shortHandText.toLowerCase(),
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
