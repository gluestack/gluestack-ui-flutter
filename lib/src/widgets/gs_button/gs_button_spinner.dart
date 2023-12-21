import 'package:flutter/material.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_spinner_style.dart';

class GSButtonSpinner extends StatelessWidget {
  final GSStyle? style;
  final Color? backgroundColor;
  final Color? color;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double strokeWidth;
  final StrokeCap? strokeCap;
  const GSButtonSpinner(
      {super.key,
      this.style,
      this.backgroundColor,
      this.color,
      this.semanticsLabel,
      this.semanticsValue,
      this.strokeCap,
      this.strokeWidth = 4.0});

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsButtonSpinnerConfig.ancestorStyle.first];

    final styler = resolveStyles2(
        context: context,
        styles: [
          buttonIconStyle,
          ancestorStyles,
        ],
        inlineStyle: style,
        isFirst: true,
        );

    return SizedBox(
      width: styler.width,
      height: styler.height,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: color,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsLabel,
        strokeWidth: strokeWidth,
        strokeCap: strokeCap,
        valueColor: AlwaysStoppedAnimation<Color>(
            styler.props?.color ?? $GSColors.primary500),
      ),
    );
  }
}
