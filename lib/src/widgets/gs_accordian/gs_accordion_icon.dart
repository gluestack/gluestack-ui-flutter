import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_icon.dart';

class GSAccordionIcon extends StatelessWidget {
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

  const GSAccordionIcon({
    super.key,
    required this.icon,
    this.size,
    this.style,
    this.fill,
    this.grade,
    this.opticalSize,
    this.weight,
    this.semanticLabel,
    this.shadows,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    final styler = resolveStyles(
        context: context,
        styles: [
          accordionIconStyle,
        ],
        inlineStyle: style);

    GSIconSizes? conv(GSSizes? size) {
      for (GSIconSizes isize in GSIconSizes.values) {
        if (isize.name == size?.name) {
          return isize;
        }
      }
      return null;
    }

    return GSIcon(
      icon: icon,
      size: conv(styler.iconSize ?? styler.props?.size) ?? size,
      style: styler,
      fill: fill,
      grade: grade,
      opticalSize: opticalSize,
      weight: weight,
      semanticLabel: semanticLabel,
      shadows: shadows,
      textDirection: textDirection,
    );
  }
}
