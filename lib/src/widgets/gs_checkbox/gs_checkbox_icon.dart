import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_checkbox/gs_checkbox_icon_style.dart';

class GSCheckBoxIcon extends StatelessWidget {
  final GSStyle? style;
  const GSCheckBoxIcon({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkboxIconConfig.ancestorStyle.first];

    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.isChecked ?? false;
    final isDisabled = value?.isDisabled ?? true;

    final iconSize = ancestorCheckBoxStyle?.props?.size;
    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        checkboxIconStyle,
        checkboxIconStyle.sizeMap(iconSize),
      ],
      inlineStyle: style,
      isFirst: true,
    );
    final color = isChecked ? styler.checked?.color : styler.color;
    return Opacity(
      opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.0 : 1,
      child: Icon(
        const IconData(0xe156, fontFamily: 'MaterialIcons'),
        color: color?.getColor(context),
        size: styler.height,
      ),
    );
  }
}
