import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_text_style.dart';


class GSButtonText extends StatelessWidget {
  final String text;
  final GSStyle? style;

  const GSButtonText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsTextConfig.ancestorStyle.first];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        buttonTextStyle,
        buttonTextStyle.sizeMap(ancestorStyles?.props?.size),
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
