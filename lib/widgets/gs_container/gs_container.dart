import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/widgets/style/style_data.dart';

class GSBox extends StatelessWidget {
  final Widget child;
  final StyleData? style;
  const GSBox({
    super.key,
    required this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: style != null
          ? style!.alignment ?? Alignment.center
          : Alignment.center,
      padding: style != null
          ? style!.padding ??
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
          : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      height: style != null ? style!.height : null,
      width: style != null ? style!.width : null,
      constraints: BoxConstraints(
        minWidth: style != null ? style!.width ?? 0 : 0,
        minHeight: style != null ? style!.height ?? 0 : 0,
      ),
      margin: style != null
          ? style!.margin ??
              const EdgeInsets.symmetric(vertical: 0, horizontal: 0)
          : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: BoxDecoration(
        color: style != null
            ? style!.color ?? Colors.transparent
            : Colors.transparent,
        borderRadius:
            BorderRadius.circular(style != null ? style!.borderRadius ?? 0 : 0),
        border: Border.all(
            color: style != null
                ? style!.borderColor ?? Colors.transparent
                : Colors.transparent,
            width: style != null ? style!.borderWidth ?? 0 : 0),
      ),
      child: child,
    );
  }
}
