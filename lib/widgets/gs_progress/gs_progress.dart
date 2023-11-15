import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_progress/gs_progress_style.dart';

class GSProgress extends StatelessWidget {
  final GSStyle? style;
  final GSSizes? size;
  final double? value;
  final String? semanticsLabel;
  final String? semanticsValue;
  const GSProgress(
      {super.key,
      this.style,
      this.size,
      this.value = 0,
      this.semanticsLabel,
      this.semanticsValue});

  @override
  Widget build(BuildContext context) {
    final progressSize = size ?? progressStyle.props?.size;
    GSStyle styler = resolveStyles(
      context,
      variantStyle: progressStyle,
      size: GSProgressStyle.size[progressSize],
      inlineStyle: style,
    )!;
    final progressColor = styler.bg ?? progressStyle.bg;
    final valueColor = styler.progressValueColor ?? $GSColors.primary500;
    final borderRadius = styler.borderRadius ?? progressStyle.borderRadius;
    print(styler.height);
    return SizedBox(
      width: 200,
      height: styler.height,
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: progressColor,
        color: valueColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
      ),
    );
  }
}