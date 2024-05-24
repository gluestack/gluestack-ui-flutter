import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_provider.dart';

class GSFabIcon extends StatelessWidget {
  final IconData icon;
  final GSStyle? style;
  const GSFabIcon({
    super.key,
    required this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final ancestorStyles = GSFabProvider.of(context)
        ?.descendantStyles?[gsfabIconConfig.ancestorStyle.first];

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [
        fabIconStyle,
        fabIconStyle.sizeMap(ancestorStyles?.props?.size),
        ancestorStyles,
      ],
      inlineStyle: style,
    );

    return Icon(
      icon,
      color: styler.color?.getColor(context),
      size: styler.height,
    );
  }
}
