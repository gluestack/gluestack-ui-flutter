import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

class GSIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final GestureDoubleTapCallback? onDoubleTap;
  final String? semanticsLabel;

  final GSStyle? style;
  const GSIconButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.onLongPress,
      this.onDoubleTap,
      this.style,
      this.semanticsLabel});

  @override
  Widget build(BuildContext context) {
    return GSButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      semanticsLabel: semanticsLabel,
      style: style,
      child: GSIcon(icon: icon),
    );
  }
}
