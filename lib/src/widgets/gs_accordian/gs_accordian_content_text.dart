import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';

import 'gs_accordian_content_text_style.dart';

class GSAccordionContent extends StatelessWidget {
  /// The text to display within the accordion content area. This is the primary
  /// content of the widget and is required.
  final String text;

  /// Custom [GSStyle] to apply to the text. This allows for further customization
  /// of text appearance, specify using textStyle inside [GSStyle].
  final GSStyle? style;

  /// Determines if the text should be truncated with an ellipsis when it overflows.
  /// Defaults to `false`, meaning text will wrap by default.
  final bool isTruncated;

  /// If `true`, makes the text bold. Defaults to `false`.
  final bool bold;

  /// If `true`, renders the text in italic. Defaults to `false`.
  final bool italic;

  /// If `true`, adds an underline to the text. Defaults to `false`.
  final bool underline;

  /// If `true`, adds a strikethrough line to the text. Defaults to `false`.
  final bool strikeThrough;

  /// If `true`, highlights the text. This could be used to bring attention to
  /// specific parts of the content. Defaults to `false`.
  final bool highlight;

  /// The locale used for the text, affecting how it's formatted and displayed.
  final Locale? locale;

  /// The maximum number of lines for the text to span. Overflowing text will be
  /// truncated based on the [overflow] property. If null, text can span an unlimited
  /// number of lines.
  final int? maxLines;

  /// How visual overflow should be handled. Defaults to [TextOverflow.clip] if not specified.
  final TextOverflow? overflow;

  /// The color to use when painting the selection. Defaults to null, in which case
  /// the selection color of the environment is used.
  final Color? selectionColor;

  /// An optional semantic label for the text, providing a description for screen readers.
  final String? semanticsLabel;

  /// Whether the text should break at soft line breaks. If false, the glyphs in the
  /// text will be positioned as if there was unlimited horizontal space.
  final bool? softWrap;

  /// The strut style to use. Strut style defines the minimum height a line can be
  /// relative to the font size of the text.
  final StrutStyle? strutStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text. This decides how [textAlign] values like
  /// [TextAlign.start] and [TextAlign.end] are interpreted.
  final TextDirection? textDirection;

  /// The behavior of the text's height. This can be used to modify how text height
  /// is calculated.
  final TextHeightBehavior? textHeightBehavior;
  final TextScaler? textScaler;

  /// Determines how the width of the text is measured.
  final TextWidthBasis? textWidthBasis;

  const GSAccordionContent({
    super.key,
    required this.text,
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
    this.underline = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = GSAccordionProvider.of(context)?.size ?? GSAccordionSizes.$md;

    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsAccordianContentTextConfig.ancestorStyle.first];
    // Resolve the final GSStyle.

    final styler = resolveStyles(
      context: context,
      styles: [
        gsAccordianContentTextStyle,
        gsAccordianContentTextStyle.sizeMap(ancestorStyles?.props?.size),
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    return GSText(
      text: text,
      size: size.toGSSize,
      style: styler,
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
      bold: bold,
      highlight: highlight,
      isTruncated: isTruncated,
      italic: italic,
      strikeThrough: strikeThrough,
      underline: underline,
    );
  }
}
