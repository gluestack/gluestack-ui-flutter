import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_icon_button/style_icon_button.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

/// predefined sizes for [GSIconButton], providing a consistent set of size options for icon buttons.
enum GSIconButtonSizes {
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
  final bool? showHighlight;

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
    this.size,
    this.showHighlight,
  });

  @override
  Widget build(BuildContext context) {
    final iconButtonSize = size?.toGSSize ?? iconButtonStyle.props?.size;

    GSStyle styler = resolveStyles(
      context: context,
      styles: [
        iconButtonStyle,
        iconButtonStyle.sizeMap(iconButtonSize),
      ],
      inlineStyle: style,
      isFirst: true,
    );
    return GSAncestor(
      decedentStyles: styler.descendantStyles,
      child: GsGestureDetector(
        showFocusHighlight: showHighlight ?? true,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: GSBox(
          style: styler,
          child: icon,
        ),
      ),
    );
  }
}
