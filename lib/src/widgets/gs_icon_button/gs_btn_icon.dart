import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';

/// predefined sizes for [GSIconButton], providing a consistent set of size options for icon buttons.
enum GSIconButtonSizes {
  $xs,
  $sm,
  $md,
  $lg,
}

/// A widget that represents an icon button,
/// [GSIconButton] allows for the creation of buttons with icon content, supporting various interactions
/// such as taps, long presses, and double taps.
class GSIconButton extends StatelessWidget {
  /// The icon to display within the button.
  final GSIcon icon;

  /// The callback that is called when the button is tapped.
  final VoidCallback onPressed;

  /// The callback that is called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The callback that is called when the button is double-tapped.
  final GestureDoubleTapCallback? onDoubleTap;

  /// An optional semantic label for the button, used by screen readers.
  final String? semanticsLabel;

  /// The size of the icon button, affecting its overall dimensions.
  final GSIconButtonSizes? size;

  /// Custom [GSStyle] to apply to the button, enabling detailed customization of its appearance.
  final GSStyle? style;

  ///Constructor for [GSIconButton]
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
