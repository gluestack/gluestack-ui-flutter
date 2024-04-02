import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';

import '../gs_text/public.dart';
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
    gsStepperSubtitleTextStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().stepperTitleText);
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
      style: styler,
    );
  }
}
