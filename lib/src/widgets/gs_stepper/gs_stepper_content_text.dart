import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

import 'gs_stepper_content_text_style.dart';

class GSStepperContent extends StatelessWidget {
  final String text;
  final GlueStyle? style;

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
      style: GlueStyle.fromGSStyle(styler, context),
    );
  }
}
