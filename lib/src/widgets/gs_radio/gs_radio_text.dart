import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';

import 'package:gluestack_ui/src/widgets/gs_radio/gs_radio_text_style.dart';

class GSRadioText<T> extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const GSRadioText({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final value = GSRadioProvider.of<T>(context);
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsRadioTextConfig.ancestorStyle.first];

    final fontSize = radioLabelStyle
        .sizeMap(ancestorTextStyles?.props?.size)
        ?.textStyle
        ?.fontSize;

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [radioLabelStyle],
      inlineStyle: value!.style,
      isFirst: true,
    );

    final currentTextStyle = TextStyle(
      fontSize: textStyle?.fontSize ?? fontSize,
      color: styler.color?.getColor(context),
    );

    return Opacity(
      opacity: value.isDisabled ? styler.onDisabled!.opacity! : 1,
      child: Text(
        text,
        style: currentTextStyle,
      ),
    );
  }
}
