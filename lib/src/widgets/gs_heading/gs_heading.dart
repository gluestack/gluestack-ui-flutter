import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_heading/gs_heading_style.dart';

class GSHeading extends StatelessWidget {
  final String text;
  final GSSizes? size;
  final GSStyle? style;
  final bool isTruncated;
  final bool bold;
  final bool italic;
  final bool underline;
  final bool strikeThrough;
  final bool highlight;
  final bool sub;
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
  final TextScaler? textScaler;
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

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        highlight ? headingStyle.variants?.highlight : null,
        headingStyle.sizeMap(textSize),
      ],
      inlineStyle: headingStyle.merge(style),
      isFirst: true,
    );

    final currentTextStyle = styler.textStyle?.copyWith(
      color: styler.color,
      fontWeight: bold ? FontWeight.bold : styler.textStyle?.fontWeight,
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
