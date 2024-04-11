import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';

import '../gs_text/public.dart';
import 'gs_stepper_content_text_style.dart';

class GSStepperContent extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSStepperContent({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsStepperContentTextConfig.ancestorStyle.first];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        gsStepperContentTextStyle,
        gsStepperContentTextStyle.sizeMap(ancestorStyles?.props?.size),
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    return GSText(
      text: text,
      style: styler,
    );
  }
}
