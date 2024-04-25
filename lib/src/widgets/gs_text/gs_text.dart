import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_text/gs_text_style.dart';

/// A customizable text widget  with additional styling and formatting capabilities.
class GSText extends StatelessWidget {
  /// The text to display.
  final String text;

  /// The size of the text, which determines the font size. This can be one of the predefined
  /// [GSSizes] values, allowing for consistent text scaling across the application.
  final GSSizes? size;

  /// Custom [GSStyle] to apply to the text, enabling detailed customization of text appearance,
  /// including font, color, and more, beyond the default styling.
  final GSStyle? style;

  /// Determines if the text should be truncated with an ellipsis when it overflows the available
  /// space. Defaults to `false`, allowing text to wrap by default.
  final bool isTruncated;

  /// If `true`, renders the text in a bold font weight. Defaults to `false`.
  final bool bold;

  /// If `true`, applies an italic font style to the text. Defaults to `false`.
  final bool italic;

  /// If `true`, adds an underline decoration to the text. Defaults to `false`.
  final bool underline;

  /// If `true`, applies a strikethrough decoration to the text. Defaults to `false`.
  final bool strikeThrough;

  /// If `true`, applies a highlight effect to the text. This can be useful for drawing attention
  /// or indicating importance. Defaults to `false`.
  final bool highlight;

  /// The locale used for rendering the text, affecting its format and display. This can be used
  /// to ensure the correct rendering of locale-specific characters or to apply locale-specific
  /// typographic conventions.
  final Locale? locale;

  /// The maximum number of lines the text can occupy. Text exceeding this limit will be truncated
  /// according to the [overflow] property. If null, the text can span an unlimited number of lines.
  final int? maxLines;

  /// How visual overflow of the text should be handled, such as clipping or ellipsis. Useful for
  /// controlling text display in constrained spaces.
  final TextOverflow? overflow;

  /// The color used for text selection. This can be used to customize the appearance of text
  /// selection in editable text fields within the application.
  final Color? selectionColor;

  /// An optional semantic label for the text, providing accessibility support by describing the
  /// content of the text to screen readers.
  final String? semanticsLabel;

  /// Whether the text should break at soft line breaks. If `false`, the glyphs in the text will
  /// be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// The strut style for the text, defining the minimum height a line can occupy. This property
  /// influences line spacing and can ensure consistent vertical alignment across different text
  /// elements.
  final StrutStyle? strutStyle;

  /// The alignment of the text within its bounding box. This can be used to adjust the horizontal
  /// alignment of text, such as centering or justifying.
  final TextAlign? textAlign;

  /// The directionality of the text, determining how [textAlign] values like [TextAlign.start]
  /// and [TextAlign.end] are interpreted. This is especially important for languages with
  /// different reading directions.
  final TextDirection? textDirection;

  /// Controls the behavior of the text's height, allowing for customization of how text height
  /// is calculated and rendered.
  final TextHeightBehavior? textHeightBehavior;

  ///The font scaling strategy to use when laying out and rendering the text.
  /// The value usually comes from [MediaQuery.textScalerOf], which typically reflects the user-specified text scaling value in the platform's accessibility settings. The [TextStyle.fontSize] of the text will be adjusted by the [TextScaler] before the text is laid out and rendered.
  final TextScaler? textScaler;

  /// Determines the basis for measuring the width of the text, influencing how text wrapping and
  /// overflow are handled.
  final TextWidthBasis? textWidthBasis;
  const GSText(
      {super.key,
      required this.text,
      this.size,
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
    final textSize = size ?? gstextStyle.props?.size;

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        gstextStyle,
        highlight ? gstextStyle.variants?.highlight : null,
        gstextStyle.sizeMap(textSize),
      ],
      inlineStyle: style,
      isFirst: true,
    );

    final currentTextStyle = styler.textStyle?.copyWith(
      fontFamily: styler.textStyle?.fontFamily,
      fontWeight: bold ? FontWeight.bold : styler.textStyle?.fontWeight,
      fontStyle: italic ? FontStyle.italic : styler.textStyle?.fontStyle,
      decoration: TextDecoration.combine([
        if (strikeThrough) TextDecoration.lineThrough,
        if (underline) TextDecoration.underline,
      ]),
      backgroundColor:
          highlight ? styler.bg : styler.textStyle?.backgroundColor,
      overflow:
          isTruncated ? TextOverflow.ellipsis : styler.textStyle?.overflow,
      color: styler.textStyle?.color ?? gstextStyle.textStyle?.color,
    );

    return Text(
      text,
      style: currentTextStyle,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: styler.textAlign ?? textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
    );
  }
}
