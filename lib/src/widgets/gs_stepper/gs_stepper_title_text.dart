import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

import 'gs_stepper_title_text_style.dart';

class GSStepperTitle extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSStepperTitle({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsStepperTitleTextConfig.ancestorStyle.first];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        gsStepperTitleTextStyle,
        gsStepperTitleTextStyle.sizeMap(ancestorStyles?.props?.size),
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    return GSText(
      text: text,
      style: GSStyle.fromGSConfigStyle(styler, context),
    );
  }
}
