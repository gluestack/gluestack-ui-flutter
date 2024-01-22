import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_progress/gs_progress_style.dart';

enum GSProgressSizes {
  $xs,
  $sm,
  $md,
  $lg,
  $xl,
  $2xl,
}

class GSProgress extends StatelessWidget {
  final GSStyle? style;
  final GSProgressSizes? size;
  final double? value;
  final String? semanticsLabel;
  final String? semanticsValue;
  const GSProgress(
      {super.key,
      this.style,
      this.size,
      this.value = 0,
      this.semanticsLabel,
      this.semanticsValue,
      });

  @override
  Widget build(BuildContext context) {
    final progressSize = size?.toGSSize ?? progressStyle.props?.size;
    GSStyle styler = resolveStyles(
      context: context,
      styles: [progressStyle, progressStyle.sizeMap(progressSize)],
      inlineStyle: style,
      isFirst: true,
    );
    final progressColor = styler.bg ?? progressStyle.bg;
    final valueColor = styler.progressValueColor ?? $GSColors.primary500;
    final borderRadius = styler.borderRadius ?? progressStyle.borderRadius;

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
