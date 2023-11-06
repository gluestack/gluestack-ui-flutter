import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_text/gs_text_style.dart';

class GSText extends StatelessWidget {
  final String text;
  final GSSizes? size;
  final GSStyle? style;
  final TextStyle? textStyle;
  const GSText(
      {super.key, required this.text, this.size, this.style, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final textSize = size ?? gstextStyle.props?.size;
    GSStyle styler = resolveStyles(
      context,
      size: GSTextStyles.size[textSize],
      inlineStyle: style,
    )!;

    final currentTextStyle = TextStyle(
      
      background: textStyle?.background ?? styler.textStyle?.background,
      backgroundColor:
          textStyle?.backgroundColor ?? styler.textStyle?.backgroundColor,
      color: textStyle?.color ?? styler.textStyle?.color,
      debugLabel: textStyle?.debugLabel ?? styler.textStyle?.debugLabel,
      decoration: textStyle?.decoration ?? styler.textStyle?.decoration,
      decorationColor:
          textStyle?.decorationColor ?? styler.textStyle?.decorationColor,
      decorationStyle:
          textStyle?.decorationStyle ?? styler.textStyle?.decorationStyle,
      decorationThickness: textStyle?.decorationThickness ??
          styler.textStyle?.decorationThickness,
      fontFamily: textStyle?.fontFamily ?? styler.textStyle?.fontFamily,
      fontFamilyFallback:
          textStyle?.fontFamilyFallback ?? styler.textStyle?.fontFamilyFallback,
      fontFeatures: textStyle?.fontFeatures ?? styler.textStyle?.fontFeatures,
      fontSize: textStyle?.fontSize ?? styler.textStyle?.fontSize,
      fontStyle: textStyle?.fontStyle ?? styler.textStyle?.fontStyle,
      fontVariations:
          textStyle?.fontVariations ?? styler.textStyle?.fontVariations,
      fontWeight: textStyle?.fontWeight ?? styler.textStyle?.fontWeight,
      foreground: textStyle?.foreground ?? styler.textStyle?.foreground,
      height: textStyle?.height ?? styler.textStyle?.height,
      inherit: textStyle?.inherit ?? styler.textStyle?.inherit ?? true,
      leadingDistribution: textStyle?.leadingDistribution ??
          styler.textStyle?.leadingDistribution,
      letterSpacing:
          textStyle?.letterSpacing ?? styler.textStyle?.letterSpacing,
      locale: textStyle?.locale ?? styler.textStyle?.locale,
      overflow: textStyle?.overflow ?? styler.textStyle?.overflow,
      shadows: textStyle?.shadows ?? styler.textStyle?.shadows,
      textBaseline: textStyle?.textBaseline ?? styler.textStyle?.textBaseline,
      wordSpacing: textStyle?.wordSpacing ?? styler.textStyle?.wordSpacing,
    );
    print(currentTextStyle);
    return Text(

      
      text,
      style: currentTextStyle,
    );
  }
}
