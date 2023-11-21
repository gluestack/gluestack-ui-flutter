import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor.dart';
import 'package:gluestack_flutter_pro/widgets/gs_fab/gs_fab_style.dart';

class GSFab extends StatelessWidget {
  final GSSizes? size;
  final Widget? label;
  const GSFab({super.key, this.size, this.label});

  @override
  Widget build(BuildContext context) {
    final styler = resolveStyles(context,
        variantStyle: baseFabStyle, size: GSFabStyle.size[size],
        descendantStyleKeys: fabConfig.descendantStyle
        )!;
   
    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(styler.borderRadius ?? 0.0))),
            padding: MaterialStateProperty.all(styler.padding),
            backgroundColor: MaterialStateProperty.all(styler.bg),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [if (label != null) label!],
          )),
    );
  }
}
