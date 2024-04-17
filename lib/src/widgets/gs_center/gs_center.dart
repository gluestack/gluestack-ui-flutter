import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/resolver.dart';

/// A widget that centers its child within itself according to the alignments
/// specified in [GSConfigStyle]. [GSCenter] provides a simple way to center content
/// while also allowing for additional styling options through [GSConfigStyle].
class GSCenter extends StatelessWidget {
  /// Custom [GSConfigStyle] to apply to this widget. This allows for specifying
  /// color and alignment properties to control how
  /// the child widget is centered along with height and width.
  final GSStyle? style;

  /// The widget to be centered within this [GSCenter] widget. [child] will be
  /// aligned in the center based on the resolved [GSConfigStyle] alignment properties.
  final Widget child;

  const GSCenter({super.key, required this.child, this.style});

  @override
  Widget build(BuildContext context) {
    // Resolve the GSStyle for the GSCenter widget, applying provided styles
    // and default styles to determine the final appearance and behavior.
    GSConfigStyle styler = resolveStyles(
      context: context,
      styles: [GSConfigStyle()],
      inlineStyle: style,
      isFirst: true,
    );

    final x = resolveAlignment(styler.alignItems),
        y = resolveAlignment(styler.justifyContent);

    return Container(
      decoration: BoxDecoration(
          color:
              styler.bg?.getColor(context) ?? styler.color?.getColor(context)),
      height: style?.height,
      width: style?.width,
      child: Align(
        alignment: Alignment(x, y),
        child: child,
      ),
    );
  }
}
