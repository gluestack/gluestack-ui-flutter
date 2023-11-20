import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';

class GSCheckBoxIcon extends StatelessWidget {
  const GSCheckBoxIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle =
        GSAncestorProvider.of(context)?.decedentStyles?['_icon'];
    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.value ?? false;
    final isDisabled = value?.isDisabled ?? true;

    final iconSize = ancestorCheckBoxStyle?.props?.size;
    final styler = resolveStyles(context,
        variantStyle: checkboxIconStyle,
        size: GSCheckBoxIconStyle.size[iconSize]);
    final color = isChecked ? styler?.checked?.color : styler?.color;
    return Opacity(
      opacity: isDisabled ? styler?.onDisabled?.opacity ?? 0.0 : 1,
      child: Icon(
        Icons.check,
        color: color,
        size: styler?.height,
      ),
    );
  }
}
