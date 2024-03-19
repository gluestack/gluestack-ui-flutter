import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/public.dart';
import 'package:gluestack_ui/src/widgets/gs_icon/gs_icon_style.dart';
import 'package:gluestack_ui/src/widgets/gs_icon_button/style_icon_button.dart';

enum GSIconSizes { $xs, $sm, $md, $lg, $xl }

class GSIcon extends StatelessWidget {
  final IconData icon;
  final GSIconSizes? size;
  final GSStyle? style;
  final double? fill;
  final double? grade;
  final double? opticalSize;
  final double? weight;
  final String? semanticLabel;
  final List<Shadow>? shadows;
  final TextDirection? textDirection;
  const GSIcon(
      {super.key,
      this.size,
      this.style,
      required this.icon,
      this.fill,
      this.grade,
      this.opticalSize,
      this.weight,
      this.semanticLabel,
      this.shadows,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    final GSStyle? ancestorStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gsIconConfig.ancestorStyle.first];
    final iconSize =
        size?.toGSSize ?? ancestorStyles?.props?.size ?? iconStyle.props?.size;

    GSStyle styler = resolveStyles(
        context: context,
        styles: [
          iconStyle,
          iconStyle.sizeMap(iconSize),
          ancestorStyles,
        ],
        inlineStyle: style,
        isFirst: true);

    return Icon(
      icon,
      size: styler.width ?? styler.height,
      color: styler.color,
      fill: fill,
      grade: grade,
      opticalSize: opticalSize,
      semanticLabel: semanticLabel,
      shadows: shadows,
      textDirection: textDirection,
      weight: weight,
    );
  }
}
