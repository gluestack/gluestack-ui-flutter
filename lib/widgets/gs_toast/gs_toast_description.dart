import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_description_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_title_style.dart';

class GSToastDescription extends StatelessWidget {
  final String description;
  final GSStyle? style;
  const GSToastDescription({super.key, required this.description, this.style});

  @override
  Widget build(BuildContext context) {
    final fontSize = toastDescriptionStyle.props?.size;
    final color = toastDescriptionStyle.color;

    var defaultTextStyle = TextStyle(
      color: color,
    );

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);
    return Text(
      description,
      style: mergedStyle,
    );
  }
}
