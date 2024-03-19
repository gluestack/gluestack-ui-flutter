import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_icon_button/style_icon_button.dart';
import 'package:gluestack_ui/src/utils/extension.dart';

enum GSIconButtonSizes {
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
  final bool? showHighlight;

  final GSStyle? style;
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
