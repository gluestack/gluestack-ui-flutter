import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_checkbox/gs_checkbox_label_style.dart';

class GSCheckBoxLabel extends StatelessWidget {
  final String text;
  final GSStyle? style;
  const GSCheckBoxLabel({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkBoxLabelConfig.ancestorStyle.first];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        checkBoxLabelStyle,
        checkBoxLabelStyle.sizeMap(ancestorCheckBoxStyle?.props?.size),
        // GSCheckBoxLabelStyle.size[ancestorCheckBoxStyle?.props?.size]
      ],
      inlineStyle: style,
      isFirst: true,
    );
    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.isChecked ?? false;
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final isDisabled = value?.isDisabled ?? true;

    final currentTextStyle = styler.textStyle?.copyWith(
        color: style?.textStyle?.color ??
            _resolveColor(styler,
                isChecked: isChecked,
                isDisabled: isDisabled,
                isHovered: isDisabled ? false : isHovered) ??
            styler.color);

    return Opacity(
      opacity: isDisabled ? styler.onDisabled?.opacity ?? 0.0 : 1,
      child: Text(
        text,
        style: currentTextStyle,
      ),
    );
  }

//resolve this with styleResolver in future
  Color? _resolveColor(GSStyle? styler,
      {bool isChecked = false,
      bool isHovered = false,
      bool isDisabled = false}) {
    if (isHovered && isChecked && isDisabled) {
      return styler?.onHover?.checked?.onDisabled?.color;
    } else if (isHovered && isChecked) {
      return styler?.onHover?.checked?.color;
    } else if (isHovered && isDisabled) {
      return styler?.onHover?.onDisabled?.color;
    } else if (isHovered) {
      return styler?.onHover?.color;
    } else if (isChecked) {
      return styler?.checked?.color;
    } else {
      return styler?.color;
    }
  }
}
