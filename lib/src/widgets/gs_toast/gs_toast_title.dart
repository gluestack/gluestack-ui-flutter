import 'package:flutter/material.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_ui/src/widgets/gs_toast/gs_toast_title_style.dart';

import '../gs_text/public.dart';

class GSToastTitle extends StatelessWidget {
  final String title;
  final GSStyle? style;
  const GSToastTitle({super.key, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    final ancestorTextStyles = GSAncestorProvider.of(context)
        ?.decedentStyles?[gstoastTitleConfig.ancestorStyle.first];

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        toastTitleStyle,
        ancestorTextStyles,
      ],
      inlineStyle: style,
    );

    return GSText(
      text: title,
      style: styler,
    );
  }
}
