import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_toast/gs_toast_description_style.dart';

class GSToastDescription extends StatelessWidget {
  final String description;
  final GSStyle? style;
  const GSToastDescription({super.key, required this.description, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gstoastDescriptionConfig.ancestorStyle.first];
    final fontSize = toastDescriptionStyle
        .sizeMap(toastDescriptionStyle.props?.size)
        ?.textStyle
        ?.fontSize;

    final color = toastDescriptionStyle.color;

    var defaultTextStyle = ancestorTextStyles?.textStyle
        ?.merge(TextStyle(color: getColorMap(context)[color], fontSize: fontSize));

    final mergedStyle = defaultTextStyle?.merge(style?.textStyle);
    return Text(
      description,
      style: mergedStyle,
    );
  }
}
