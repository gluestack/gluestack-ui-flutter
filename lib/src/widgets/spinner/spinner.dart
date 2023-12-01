import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/spinner/spinner_style.dart';

class Spinner extends StatelessWidget {
  final GSSpinnerSize? size;
  final GSStyle? style;
  final double? value;
  final String? semanticsLabel;
  final String? semanticsValue;
  final StrokeCap? strokeCap;
  final double? strokeAlign;
  final double? strokeWidth;

  const Spinner({
    super.key,
    this.style,
    this.size,
    this.value,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeCap,
    this.strokeAlign = 0,
    this.strokeWidth = $GSBorderWidth.$4,
  });

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: spinnerStyle,
      inlineStyle: style,
    )!;
    final spinnerColor = styler.color ?? spinnerStyle.props?.color;
    final spinnerBackgroundColor = styler.bg;
    return SizedBox(
      width: styler.width,
      height: styler.height,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth!,
        backgroundColor: spinnerBackgroundColor,
        color: spinnerColor,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        strokeAlign: strokeAlign!,
        strokeCap: strokeCap,
        value: value,
      ),
    );
  }
}