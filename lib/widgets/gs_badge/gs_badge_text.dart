import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_badge/gs_badge_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

class GSBadgeText extends StatelessWidget {
  final String text;
  final GSStyle? gsStyle;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;

  final Color? selectionColor;

  const GSBadgeText(
    String this.text, {
    super.key,
    this.gsStyle,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSBadgeProvider.of(context);
    final fontSize = GSBadgeTextStyle.textSize[value!.size];
    final textColor = value.iconAndTextColor;

    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);

    final mergedStyle =
        defaultTextStyle.merge(gsStyle != null ? gsStyle!.textStyle : style);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
