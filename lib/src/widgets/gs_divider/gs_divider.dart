import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_divider/gs_divider_style.dart';

/// A customizable divider widget that can be styled with [GSConfigStyle] and oriented
/// horizontally or vertically. [GSDivider] is designed to provide a visual separation
/// between different UI elements.
class GSDivider extends StatelessWidget {
  /// Custom [GSConfigStyle] to apply to the divider, enabling detailed customization
  /// of its appearance, including color, width, height, etc.
  final GSStyle? style;

  /// The orientation of the divider, either [GSOrientations.horizontal] or [GSOrientations.vertical].
  /// This determines how the divider is displayed within its parent container.
  final GSOrientations? orientation;
  const GSDivider({super.key, this.style, this.orientation});

  /// Helper method to create a [BorderSide] with the specified color and width.
  /// This is used to construct the divider's line with the appropriate styling.
  static BorderSide createBorderSide(BuildContext? context,
      {Color? color, double? width}) {
    if (color == null) {
      return BorderSide(
        width: width ?? 0,
      );
    }
    return BorderSide(
      color: color,
      width: width ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Resolve the divider's orientation, defaulting to horizontal if not specified.
    final dividerOrientation = orientation ?? dividerStyle.props?.orientation!;
    // Resolve the GSStyle for the divider
    // Resolve the final GSStyle.
    final styler = resolveStyles(
      context: context,
      styles: [
        dividerStyle,
        dividerOrientation == GSOrientations.horizontal
            ? dividerStyle.variants?.orientation?.horizontal
            : dividerStyle.variants?.orientation?.vertical,
      ],
      inlineStyle: style,
    );

    if (dividerOrientation == GSOrientations.horizontal) {
      return Center(
        child: SizedBox(
          width: styler.width ?? double.maxFinite,
          child: Container(
            margin: EdgeInsetsDirectional.only(
                start: styler.indent, end: styler.endIndent),
            decoration: BoxDecoration(
              border: Border(
                bottom: createBorderSide(context,
                    color: styler.bg?.getColor(context) ??
                        styler.color?.getColor(context) ??
                        const Color(0xaaaaaaaa),
                    width: styler.height ?? 1), //thickness
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: styler.height,
        child: Center(
          child: Container(
            width: 0,
            margin: EdgeInsetsDirectional.only(
                top: styler.indent, bottom: styler.endIndent),
            decoration: BoxDecoration(
              border: Border(
                left: createBorderSide(
                  context,
                  color: styler.bg?.getColor(context) ??
                      styler.color?.getColor(context) ??
                      const Color(0xaaaaaaaa),
                  width: styler.width ?? 1, //thickness),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
