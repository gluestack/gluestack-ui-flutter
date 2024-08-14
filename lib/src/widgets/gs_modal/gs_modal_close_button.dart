import 'package:flutter/gestures.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_close_button_style.dart';
import 'package:gluestack_ui/src/widgets/gs_modal/gs_modal_provider.dart';

/// predefined sizes for [GSModalCloseButton], providing a consistent set of size options for icon buttons.
enum GSModalCloseButtonSizes {
  $xs,
  $sm,
  $md,
  $lg,
}

/// A widget that represents an icon button,
/// [GSModalCloseButton] allows for the creation of buttons with icon content, supporting various interactions
/// such as taps, long presses, and double taps.
class GSModalCloseButton extends StatelessWidget {
  /// The icon to display within the button.
  final GSIcon icon;

  /// The callback that is called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// The callback that is called when the button is double-tapped.
  final GestureDoubleTapCallback? onDoubleTap;

  /// An optional semantic label for the button, used by screen readers.
  final String? semanticsLabel;

  /// The size of the icon button, affecting its overall dimensions.
  final GSModalCloseButtonSizes? size;

  /// Custom [GSConfigStyle] to apply to the button, enabling detailed customization of its appearance.
  final GSStyle? style;

  final GSButtonVariants? variant;

  final GSButtonActions? action;

  ///Constructor for [GSModalCloseButton]
  const GSModalCloseButton({
    super.key,
    required this.icon,
    this.onLongPress,
    this.onDoubleTap,
    this.style,
    this.semanticsLabel,
    this.action,
    this.variant,
    this.size = GSModalCloseButtonSizes.$md,
  });

  @override
  Widget build(BuildContext context) {
    GSButtonSizes? sizeAdapt(GSModalCloseButtonSizes buttonSize) {
      for (GSButtonSizes bSize in GSButtonSizes.values) {
        if (bSize.name == buttonSize.name) {
          return bSize;
        }
      }
      return null;
    }

    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [gsModalCloseButtonStyle],
      inlineStyle: style,
    );

    final removeModal = GSModalProvider.of(context)?.removeModal;

    return GSButton(
      variant: variant ?? GSButtonVariants.link,
      action: action ?? GSButtonActions.primary,
      onPressed: () {
        removeModal!();
      },
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      semanticsLabel: semanticsLabel,
      style: style ??
          GSStyle(
            color: styler.color?.getColor(context),
            iconColor: styler.iconColor?.getColor(context),
            padding: styler.padding,
            borderRadius: style?.borderRadius,
          ),
      size: sizeAdapt(size!),
      child: icon,
    );
  }
}
