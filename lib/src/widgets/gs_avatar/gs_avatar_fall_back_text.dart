import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_avatar/gs_avatar_fall_back_text_style.dart';

/// A widget specifically designed for displaying fallback text within a [GSAvatar].
class GSAvatarFallBackText extends StatelessWidget {
   /// The text to be displayed as fallback content within the [GSAvatar]. This is
  /// typically used when an image cannot be loaded or is not provided.
  final String text;

  /// Style for the [GSAvatar] text. Can be customized using [GSStyle].
  final GSStyle? style;

  /// Determines if the text should be truncated with an ellipsis when it overflows the
  /// available space. Defaults to `false`, allowing text to wrap by default.
  final bool isTruncated;

  /// If `true`, renders the text in a bold font weight. Useful for drawing attention or
  /// indicating importance. Defaults to `false`.
  final bool bold;

  /// If `true`, applies an italic font style to the text, adding emphasis or distinguishing
  /// the text from surrounding content. Defaults to `false`.
  final bool italic;

  /// If `true`, adds an underline decoration to the text, which can be used for emphasis or
  /// as a stylistic choice. Defaults to `false`.
  final bool underline;

  /// If `true`, applies a strikethrough decoration to the text, typically used to indicate
  /// that something is no longer relevant or has been completed. Defaults to `false`.
  final bool strikeThrough;

  /// If `true`, applies a highlight effect to the text. This can be used to draw attention
  /// to the text within the avatar. Defaults to `false`.
  final bool highlight;

  /// The locale used for rendering the text, affecting its format and display.
  /// This can be used to ensure the correct rendering of locale-specific characters
  /// or to apply locale-specific typographic conventions. Defaults to the current locale.
  final Locale? locale;

  /// The maximum number of lines the text can occupy. Text exceeding this limit will be
  /// truncated according to the [overflow] property. If null, the text can span an unlimited
  /// number of lines.
  final int? maxLines;

  /// How visual overflow of the text should be handled, such as clipping or ellipsis.
  /// Useful for controlling text display in constrained spaces.
  final TextOverflow? overflow;

  /// The color used for text selection. This can be used to customize the appearance of text
  /// selection in editable text fields within the avatar. Defaults to the ambient selection color.
  final Color? selectionColor;

  /// An optional semantic label for the text, providing accessibility support by describing the
  /// content of the text to screen readers. This enhances the accessibility of the [GSAvatar].
  final String? semanticsLabel;

  /// Whether the text should break at soft line breaks. If `false`, the glyphs in the text will
  /// be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// The strut style for the text, defining the minimum height a line can occupy. This property
  /// influences line spacing and can ensure consistent vertical alignment across different text elements.
  final StrutStyle? strutStyle;

  /// The alignment of the text within its bounding box. This can be used to adjust the horizontal
  /// alignment of text, such as centering or justifying. Defaults to [TextAlign.start].
  final TextAlign? textAlign;

  /// The directionality of the text, determining how [textAlign] values like [TextAlign.start]
  /// and [TextAlign.end] are interpreted. This is especially important for languages with
  /// different reading directions. Defaults to the ambient [TextDirection].
  final TextDirection? textDirection;

  /// Controls the behavior of the text's height, allowing for customization of how text height
  /// is calculated and rendered. This can affect how text is aligned vertically within the [GSAvatar].
  final TextHeightBehavior? textHeightBehavior;

  /// A mechanism to scale the text size dynamically, allowing for text size adjustments based
  /// on user preferences or accessibility settings. This can help ensure the text remains legible
  /// and accessible to all users.
  final TextScaler? textScaler;

  /// Determines the basis for measuring the width of the text, influencing how text wrapping and
  /// overflow are handled. This can affect how text is laid out within the [GSAvatar], especially
  /// in cases where space is limited.
  final TextWidthBasis? textWidthBasis;

  /// Constructor for GSAvatarFallBackText widget:
  const GSAvatarFallBackText(
      //takes string as input just like inbuilt Text widget from flutter
      this.text,
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
      this.textScaler,
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
    final mergedStyle = baseTextStyle?.merge(style?.textStyle);

    // Create a Text widget with the specified text and merged style.
    //TODO: handle descendent style overwrite for text transform
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
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
    );
  }
}
