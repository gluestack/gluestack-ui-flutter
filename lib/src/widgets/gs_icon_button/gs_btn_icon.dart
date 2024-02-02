import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

enum GSIconButtonSizes {
  $xs,
  $sm,
  $md,
  $lg,
}

class GSIconButton extends StatelessWidget {
  final GSIcon icon;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final GestureDoubleTapCallback? onDoubleTap;
  final String? semanticsLabel;
  final GSIconButtonSizes? size;

  final GSStyle? style;
  const GSIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.onLongPress,
    this.onDoubleTap,
    this.style,
    this.semanticsLabel,
    this.size = GSIconButtonSizes.$md,
  });

  @override
  Widget build(BuildContext context) {
    GSButtonSizes? sizeAdapt(GSIconButtonSizes buttonSize) {
      for (GSButtonSizes bSize in GSButtonSizes.values) {
        if (bSize.name == buttonSize.name) {
          return bSize;
        }
      }
      return null;
    }

    return GSButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      semanticsLabel: semanticsLabel,
      style: style,
      size: sizeAdapt(size!),
      child: icon,
    );
  }
}
