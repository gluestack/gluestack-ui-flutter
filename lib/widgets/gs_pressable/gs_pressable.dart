import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/widgets/gs_pressable/gs_pressable_style.dart';

class GSPressable extends StatelessWidget {
  final GSStyle? style;
  final Widget child;
  ///Sets additional distance outside of element in which a press can be detected.
  final double? hitSlop;
  final GestureTapCallback? onPress;
  final GestureTapUpCallback? onPressIn;
  final GestureTapDownCallback? onPressOut;
  final GestureLongPressCallback? onLongPress;
  const GSPressable(
      {super.key,
      this.style,
      required this.child,
      this.onPress,
      this.onLongPress,
      this.onPressIn,
      this.onPressOut,
      this.hitSlop});

  @override
  Widget build(BuildContext context) {
    GSStyle styler = resolveStyles(
      context,
      variantStyle: pressableStyle,
      inlineStyle: style,
    )!;

    return InkWell(
      onTap: onPress,
      onTapUp: onPressIn,
      onTapDown: onPressOut,
      onLongPress: onLongPress,
      hoverColor: styler.onHover?.color,
      splashColor: styler.onHover?.bg,
      borderRadius: BorderRadius.circular(styler.borderRadius ?? 0),
      child: Padding(
        padding: EdgeInsets.all(hitSlop ?? 0),
        child: child,
      ),
    );
  }
}
