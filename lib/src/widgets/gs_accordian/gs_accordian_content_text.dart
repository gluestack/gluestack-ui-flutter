import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/gs_accordian_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_content_text.dart';

class GSAccordionContent extends StatelessWidget {
  final String text;
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
    this.textScaleFactor,
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
    final contentTextStyle =
        GSAccordionProvider.of(context)?.baseAccordionStyle.contentTextStyle;

    final styler = resolveStyles(
      context: context,
      styles: [
        accordionContentText,
      ],
      inlineStyle: style,
    ).merge(
      GSStyle(textStyle: contentTextStyle),
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
      textScaleFactor: textScaleFactor,
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
