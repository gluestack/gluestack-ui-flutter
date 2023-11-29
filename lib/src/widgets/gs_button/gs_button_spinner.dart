import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/token/public.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_spinner_style.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_style.dart';

import '../gs_ancestor/gs_ancestor_provider.dart';

class GSButtonSpinner extends StatelessWidget {
  final GSStyle? style;
  const GSButtonSpinner({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final value = GSButtonProvider.of(context);
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
