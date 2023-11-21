import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/widgets/gs_toast/gs_toast_title_style.dart';

class GSToastTitle extends StatelessWidget {
  final String title;
  final GSStyle? style;
  const GSToastTitle({super.key, required this.title, this.style});

  @override
  Widget build(BuildContext context) {
    final fontSize = toastTitleStyle.props?.size;
    final color = toastTitleStyle.color;
    final fontWeight = toastTitleStyle.fontWeight;

    var defaultTextStyle = TextStyle(
      color: color,
      fontWeight: fontWeight,
    );

    final mergedStyle =
        defaultTextStyle.merge(style != null ? style!.textStyle : null);
    return Text(
      title,
      style: mergedStyle,
    );
  }
}
