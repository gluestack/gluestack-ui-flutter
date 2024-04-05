import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_fab/gs_fab_icon_style.dart';

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
    final ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsfabIconConfig.ancestorStyle.first];



    GSStyle styler = resolveStyles(
      context: context,
      styles: [fabIconStyle.merge(ancestorStyles), 
      //TODO: Check this once again.
      fabIconStyle.sizeMap(ancestorStyles?.props?.size)],
      inlineStyle: style,
      isFirst: true,
    );

    return Icon(
      icon,
      color: styler.color,
      size: styler.height,
    );
  }
}
