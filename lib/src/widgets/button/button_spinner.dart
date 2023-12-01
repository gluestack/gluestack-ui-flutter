import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/button/button_provider.dart';
import 'package:gluestack_ui/src/widgets/button/button_spinner_style.dart';
import 'package:gluestack_ui/src/widgets/button/button_style.dart';

import '../gs_ancestor/gs_ancestor_provider.dart';

class ButtonSpinner extends StatelessWidget {
  final GSStyle? style;
  const ButtonSpinner({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final value = ButtonProvider.of(context);
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsButtonSpinnerConfig.ancestorStyle.first];

    final spinnerColor = ancestorTextStyles?.color;

    GSStyle styler = resolveStyles(
      context,
      variantStyle: GSStyle(color: spinnerColor),
      size: GSButtonStyle.size[value?.size],
      inlineStyle: style,
    )!;

    return SizedBox(
      width: styler.width,
      height: styler.height,
      child: CircularProgressIndicator(
        strokeWidth: $GSBorderWidth.$2,
        valueColor:
            AlwaysStoppedAnimation<Color>(styler.color ?? $GSColors.primary500),
      ),
    );
  }
}
