import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_icon_style.dart';

class GSButtonIcon extends StatelessWidget {
  final IconData icon;
  final GSSizes? iconSize;
  final GSStyle? style;

  const GSButtonIcon({
    super.key,
    required this.icon,
    this.style,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsButtonIconStyle.ancestorStyle.first];
    final value = GSButtonProvider.of(context);
    final size = GSButtonIconStyle.size[iconSize ?? value?.size];

    // Resolve the final GSStyle.
    final styler = resolveStyles(
        context: context,
        styles: [
          buttonIconStyle,
          buttonIconStyle.sizeMap(ancestorStyles?.props?.size),
          ancestorStyles,
        ],
        inlineStyle: style);

    return Icon(
      icon,
      color: styler.color?.getColor(context),
      size: size,
    );
  }
}
