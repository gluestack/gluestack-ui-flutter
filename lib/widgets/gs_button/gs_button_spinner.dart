import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

class GSButtonSpinner extends StatelessWidget {
  final GSStyle? style;
  const GSButtonSpinner({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final value = GSButtonProvider.of(context);
    final spinnerColor = GSButtonStyle
        .gsButtonCombination[value?.action]![value?.variant]?.spinnerColor;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(spinnerColor: spinnerColor),
      size: GSButtonStyle.size[value?.size],
      inlineStyle: style,
    )!;

    return SizedBox(
      width: styler.width,
      height: styler.height,
      child: CircularProgressIndicator(
        strokeWidth: $GSBorderWidth.$2,
        valueColor: AlwaysStoppedAnimation<Color>(
            styler.spinnerColor ?? $GSColors.primary500),
      ),
    );
  }
}
