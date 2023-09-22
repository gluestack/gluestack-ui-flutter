import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_provider.dart';
import 'package:gluestack_flutter_pro/widgets/styled_button/styled_button_variants.dart';

class GSButtonText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const GSButtonText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final value = GSButtonProvider.of(context);
    final textColor = buttonVariants
        .variants['action']![value?.action]![value?.variant]?['textColor'];
    final fontSize = buttonVariants.variants['size']?[value?.size]['fontSize'];

    var defaultTextStyle = TextStyle(color: textColor, fontSize: fontSize);

    final mergedStyle = defaultTextStyle.merge(style);

    return Text(
      text,
      style: mergedStyle,
    );
  }
}
