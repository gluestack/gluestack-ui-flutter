import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_button/gs_button_provider.dart';

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
buttonIconStyle = GSStyle.fromMap(
        data: getIt<GluestackCustomConfig>().icon)
    .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().buttonIcon));
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
      color: styler.color,
      size: size,
    );
  }
}
