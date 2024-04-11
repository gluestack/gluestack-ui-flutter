import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_heading/gs_heading_style.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

/// A widget designed to display headings with customizable styles within the Gluestack UI framework.
/// [GSHeading] supports various typographic customizations, making it suitable for titles,
/// headings, and other prominent text elements in your application.
class GSHeading extends StatelessWidget {
  /// The text content of the heading. This is the primary display text for the widget.
  final String text;

  /// The size of the text, allowing for predefined scaling according to [GSSizes].
  /// This provides a consistent method for adjusting text size across different headings.
  final GSHeadingSizes? size;

  /// Custom [GSStyle] to apply to the heading, enabling detailed customization
  /// of text appearance, including font, color, size, and more.
  final GSStyle? style;

  /// Determines if the heading should be truncated with an ellipsis when it overflows
  /// the available space. Defaults to `false`, allowing text to wrap by default.
  final bool isTruncated;

  /// If `true`, renders the heading text in a bold font weight. Defaults to `false`.
  final bool bold;

  /// If `true`, applies an italic font style to the heading text. Defaults to `false`.
  final bool italic;

  /// If `true`, adds an underline decoration to the heading text. Defaults to `false`.
  final bool underline;

  /// If `true`, applies a strikethrough decoration to the heading text. Defaults to `false`.
  final bool strikeThrough;

  /// If `true`, applies a highlight effect to the heading text. Defaults to `false`.
  final bool highlight;

  /// Indicates if the heading should be styled as a subtitle or secondary text,
  /// potentially applying a smaller font size and adjusted line height. Defaults to `false`.
  final bool sub;

  /// The locale used for rendering the heading text, affecting its format and display.
  final Locale? locale;

  /// The maximum number of lines the heading text can occupy. Text exceeding this limit
  /// will be truncated according to the [overflow] property. If null, the text can span
  /// an unlimited number of lines.
  final int? maxLines;

  /// How visual overflow of the heading text should be handled, such as clipping or ellipsis.
  final TextOverflow? overflow;

  /// The color used for text selection within the heading. Defaults to null, in which case
  /// the selection color of the environment is used.
  final Color? selectionColor;

  /// An optional semantic label for the heading text, enhancing accessibility by providing
  /// a text description for screen readers.
  final String? semanticsLabel;

  /// Whether the heading text should break at soft line breaks. Defaults to null, allowing
  /// the environment's setting to determine behavior.
  final bool? softWrap;

  /// The strut style for the heading text, defining the minimum height a line can occupy.
  final StrutStyle? strutStyle;

  /// The alignment of the heading text within its bounding box. Defaults to null, allowing
  /// the environment's setting to determine alignment.
  final TextAlign? textAlign;

  /// The directionality of the heading text, determining how [textAlign] values are interpreted.
  final TextDirection? textDirection;

  /// Controls the behavior of the heading text's height, allowing customization of how text height
  /// is calculated and rendered.
  final TextHeightBehavior? textHeightBehavior;

  /// A mechanism to scale the text size dynamically, suitable for adjusting text size based
  /// on user preferences or accessibility settings.
  final TextScaler? textScaler;

  /// Determines the basis for measuring the width of the heading text, influencing text wrapping
  /// and overflow handling.
  final TextWidthBasis? textWidthBasis;
  const GSHeading(
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
      this.sub = false,
      this.bold = false,
      this.highlight = false,
      this.isTruncated = false,
      this.italic = false,
      this.strikeThrough = false,
      this.underline = false});

  @override
  Widget build(BuildContext context) {
    final textSize = size ?? headingStyle.props?.size;
    final subFontSize = headingStyle.variants?.sub?.textStyle?.fontSize;
    final subLineHeight = headingStyle.variants?.sub?.textStyle?.height;
    // Resolves the heading style
    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        highlight ? headingStyle.variants?.highlight : null,
        headingStyle.sizeMap(textSize?.toGSSize),
      ],
      inlineStyle: headingStyle.merge(style),
      isFirst: true,
    );

    final currentTextStyle = styler.textStyle?.copyWith(
      color: styler.color,
      fontWeight: bold ? FontWeight.w900 : styler.textStyle?.fontWeight,
      fontStyle: italic ? FontStyle.italic : styler.textStyle?.fontStyle,
      fontSize: sub ? subFontSize : styler.textStyle?.fontSize,
      height: sub ? subLineHeight : styler.textStyle?.height,
      decoration: TextDecoration.combine([
        if (strikeThrough) TextDecoration.lineThrough,
        if (underline) TextDecoration.underline,
      ]),
      backgroundColor:
          highlight ? styler.bg : styler.textStyle?.backgroundColor,
      overflow:
          isTruncated ? TextOverflow.ellipsis : styler.textStyle?.overflow,
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
      textAlign: textAlign,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
    );
  }
}
