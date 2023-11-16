import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_ancestor/gs_ancestor_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_link/gs_link_text_style.dart';

class GSLinkText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const GSLinkText({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
    final ancestorTextStyles =
        GSAncestorProvider.of(context)?.decedentStyles?['_text'];

    final styler = resolveStyles(context,
        variantStyle:
            isHovered ? linkTextStyle.merge(ancestorTextStyles?.onHover) :linkTextStyle,
        inlineStyle: textStyle != null ? GSStyle(textStyle: textStyle) : null)!;

    var defaultTextStyle = TextStyle(
        color: styler.color, decoration: styler.textStyle?.decoration);

    print(defaultTextStyle);

    return Text(
      text,
      style: defaultTextStyle,
    );
  }
}
