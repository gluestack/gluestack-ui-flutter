import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_text/gs_text_style.dart';

class GSText extends StatelessWidget {
  final String text;
  final GSSizes? size;
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
  final TextScaler? textScaler;
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
