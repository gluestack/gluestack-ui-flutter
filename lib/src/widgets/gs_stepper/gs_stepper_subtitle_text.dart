import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

import 'gs_stepper_subtitle_text_style.dart';

class GSStepperSubtitle extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSStepperSubtitle({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsStepperSubtitleTextConfig.ancestorStyle.first];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        gsStepperSubtitleTextStyle,
        gsStepperSubtitleTextStyle.sizeMap(ancestorStyles?.props?.size),
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
