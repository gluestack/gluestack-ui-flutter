import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab_style.dart';

class GSFab extends StatelessWidget {
  final GSSizes? size;
  final GSPlacements? placement;
  final Widget? label;
  final GSStyle? style;
  const GSFab({super.key, this.size, this.label, this.placement, this.style});

  @override
  Widget build(BuildContext context) {
    final fabSize = size ?? fabStyle.props!.size!;
    final fabPlacement = placement ?? fabStyle.props!.placement!;
    final styler = resolveStyles(context,
        variantStyle: GSFabStyle.placementVariants[fabPlacement],
        size: GSFabStyle.size[fabSize],
        descendantStyleKeys: fabConfig.descendantStyle,
        inlineStyle: style)!;

    final bool isCentered = placement == GSPlacements.bottomCenter ||
        placement == GSPlacements.topCenter;

    final widget = GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(styler.borderRadius ?? 0.0))),
            padding: MaterialStateProperty.all(styler.padding),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return styler.onActive?.bg;
              }
              if (states.contains(MaterialState.hovered)) {
                return styler.onHover?.bg;
              }

              return styler.bg;
            }),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [if (label != null) label!],
          )),
    );

    return Positioned.fill(
        bottom: styler.bottom,
        top: styler.top,
        left: isCentered ? styler.left ?? 0.0 : styler.left,
        right: isCentered ? styler.right ?? 0.0 : styler.right,
        child: isCentered
            ? Align(
                alignment: Alignment.center,
                child: widget,
              )
            : widget);
  }
}
