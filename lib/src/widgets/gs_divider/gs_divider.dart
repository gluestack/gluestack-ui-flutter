import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_divider/gs_divider_style.dart';

class GSDivider extends StatelessWidget {
  final GSStyle? style;
  final GSOrientations? orientation;
  const GSDivider({super.key, this.style, this.orientation});

  @override
  Widget build(BuildContext context) {
    final dividerOrientation = orientation ?? dividerStyle.props?.orientation!;
    GSStyle styler = resolveStyles(
      context,
      variantStyle: dividerOrientation == GSOrientations.horizontal
          ? dividerStyle.variants?.orientation?.horizontal
          : dividerStyle.variants?.orientation?.vertical,
      inlineStyle: style,
    )!;

    bool isDividerInsideColumn(BuildContext context) {
      Column? column = context.findAncestorWidgetOfExactType<Column>();

      return column != null;
    }

    bool isDividerInsideRow(BuildContext context) {
      Row? row = context.findAncestorWidgetOfExactType<Row>();

      return row != null;
    }

//for avoiding overflow
    if (dividerOrientation == GSOrientations.vertical &&
        isDividerInsideColumn(context) &&
        style?.height == null) {
      return Expanded(
        child: RotatedBox(
          quarterTurns: 2,
          child: SizedBox(
            height: styler.height,
            width: styler.width,
            child: ColoredBox(
                color: styler.bg ?? styler.color ?? dividerStyle.bg!),
          ),
        ),
      );
    } else if (dividerOrientation == GSOrientations.horizontal &&
        isDividerInsideRow(context) &&
        style?.width == null) {
      return Expanded(
        child: SizedBox(
          height: styler.height,
          width: styler.width,
          child:
              ColoredBox(color: styler.bg ?? styler.color ?? dividerStyle.bg!),
        ),
      );
    } else {
      return RotatedBox(
        quarterTurns: dividerOrientation == GSOrientations.vertical ? 2 : 0,
        child: SizedBox(
          height: styler.height,
          width: styler.width,
          child:
              ColoredBox(color: styler.bg ?? styler.color ?? dividerStyle.bg!),
        ),
      );
    }
  }
}
