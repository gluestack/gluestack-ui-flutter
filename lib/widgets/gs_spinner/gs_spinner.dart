import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_spinner/gs_spinner_style.dart';

class GSSpinner extends StatelessWidget {
  final GSSpinnerSize? size;
  final GSStyle? style;
  final double? value;
  final String? semanticsLabel;
  final String? semanticsValue;
  final StrokeCap? strokeCap;
  final double? strokeAlign;
  final double? strokeWidth;

  const GSSpinner({
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
