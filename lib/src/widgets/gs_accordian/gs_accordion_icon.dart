import 'package:gluestack_ui/src/provider/provider.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/widgets/gs_accordian/style_accordion_icon.dart';

class GSAccordionIcon extends StatelessWidget {
  /// The icon to display. This should be a valid [IconData] value, typically from
  /// material icons or custom icon packs integrated into your application.
  final IconData icon;

  /// The size of the icon. This controls how large the icon will appear within the
  /// UI. The size can be specified using predefined [GSIconSizes] values, allowing
  /// for consistency across the application.
  final GSIconSizes? size;

  /// Custom [GSStyle] to apply to the icon. This allows for further customization
  /// of the icon's appearance.
  final GSStyle? style;

  /// The fill level for icons that support variable fill states. This is typically
  /// used for custom icons designed to visually represent fill levels (e.g., battery
  /// or signal strength icons).
  final double? fill;

  /// The grade of the icon, affecting its visual density. Useful for icons that
  /// are designed to adapt their appearance based on the display context.
  final double? grade;

  /// The optical size of the icon. This can be used to adjust the icon's scaling based
  /// on its visual size rather than its physical size in pixels, allowing for better
  /// visual consistency across different display sizes and resolutions.
  final double? opticalSize;

  /// The weight of the icon, used to specify the thickness of the icon's strokes. A
  /// higher value results in thicker lines, while a lower value results in thinner lines.
  /// This allows for customization of the icon's boldness.
  final double? weight;

  /// An optional semantic label for the icon, enhancing accessibility by providing
  /// a text description for screen readers.
  final String? semanticLabel;

  /// A list of shadows to apply to the icon, enabling complex shadow effects for
  /// added depth and emphasis.
  final List<Shadow>? shadows;

  /// The text direction for the icon, determining how it should be oriented based
  /// on the directionality of the text. Useful for icons that are direction-sensitive.
  final TextDirection? textDirection;

  const GSAccordionIcon({
    super.key,
    required this.icon,
    this.size,
    this.style,
    this.fill,
    this.grade,
    this.opticalSize,
    this.weight,
    this.semanticLabel,
    this.shadows,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    // Resolve the final GSStyle.
    final styler = resolveStyles(
        context: context,
        styles: [
          accordionIconStyle,
        ],
        inlineStyle: style);

    GSIconSizes? conv(GSSizes? size) {
      for (GSIconSizes isize in GSIconSizes.values) {
        if (isize.name == size?.name) {
          return isize;
        }
      }
      return null;
    }

    return GSIcon(
      icon: icon,
      size: conv(styler.iconSize ?? styler.props?.size) ?? size,
      style: styler,
      fill: fill,
      grade: grade,
      opticalSize: opticalSize,
      weight: weight,
      semanticLabel: semanticLabel,
      shadows: shadows,
      textDirection: textDirection,
    );
  }
}
