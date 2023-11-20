import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_icon_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_checkbox/gs_checkbox_provider.dart';

class GSCheckBoxIcon extends StatelessWidget {
  final GSStyle? style;
  const GSCheckBoxIcon({super.key,this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorCheckBoxStyle = GSAncestorProvider.of(context)
        ?.decedentStyles?[checkboxIconConfig.ancestorStyle.first];

    final value = GSCheckBoxProvider.of(context);
    final isChecked = value?.value ?? false;
    final isDisabled = value?.isDisabled ?? true;

    final iconSize = ancestorCheckBoxStyle?.props?.size;
    final styler = resolveStyles(context,
        variantStyle: checkboxIconStyle,
        size: GSCheckBoxIconStyle.size[iconSize],inlineStyle: style);
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
