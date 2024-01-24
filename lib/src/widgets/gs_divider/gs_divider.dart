import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_divider/gs_divider_style.dart';

class GSDivider extends StatelessWidget {
  final GSStyle? style;
  final GSOrientations? orientation;
  const GSDivider({super.key, this.style, this.orientation});

  static BorderSide createBorderSide(BuildContext? context,
      {Color? color, double? width}) {
    if (color == null) {
      return BorderSide(
        width: width ?? 0,
      );
    }
    return BorderSide(
      color: color,
      width: width ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final dividerOrientation = orientation ?? dividerStyle.props?.orientation!;

    final styler = resolveStyles(
        context: context,
        styles: [
          dividerOrientation == GSOrientations.horizontal
              ? dividerStyle.variants?.orientation?.horizontal
              : dividerStyle.variants?.orientation?.vertical,
        ],
        inlineStyle: style);

    if (dividerOrientation == GSOrientations.horizontal) {
      return Center(
        child: SizedBox(
          width: styler.width ?? double.maxFinite,
          child: Container(
            margin: EdgeInsetsDirectional.only(
                start: styler.indent, end: styler.endIndent),
            decoration: BoxDecoration(
              border: Border(
                bottom: createBorderSide(context,
                    color: styler.bg ?? styler.color ?? const Color(0xaaaaaaaa),
                    width: styler.height ?? 1), //thickness
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: styler.height,
        child: Center(
          child: Container(
            width: 0,
            margin: EdgeInsetsDirectional.only(
                top: styler.indent, bottom: styler.endIndent),
            decoration: BoxDecoration(
              border: Border(
                left: Divider.createBorderSide(
                  context,
                  color: styler.bg ?? styler.color ?? const Color(0xaaaaaaaa),
                  width: styler.width ?? 1, //thickness),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
