import 'package:flutter/widgets.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/style_resolver.dart';
import 'package:gluestack_ui/src/utils/extension.dart';
import 'package:gluestack_ui/src/widgets/gs_icon/gs_icon_style.dart';

/// Defines the sizes available for the GSIcon.
enum GSIconSizes { $xs, $sm, $md, $lg, $xl }

/// A widget for displaying icons with enhanced styling and customization capabilities.
/// `GSIcon` supports various sizes, styles, and additional properties to adjust the
/// icon's appearance.
class GSIcon extends StatelessWidget {
  /// The icon to display. This should be a valid [IconData] value, such as material
  /// icons or custom icons integrated into your application.
  final IconData icon;

  /// The size of the icon. Utilizes predefined [GSIconSizes] for consistent sizing.
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

  /// Adjusts the icon's size based on its optical size rather than its physical
  /// size, ensuring the icon's visual weight is consistent across different sizes
  /// and resolutions.
  final double? opticalSize;

  /// The weight of the icon, influencing the thickness of the icon's lines. Allows
  /// for dynamic adjustment of the icon's stroke width.
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

  const GSIcon(
      {super.key,
      this.size,
      this.style,
      required this.icon,
      this.fill,
      this.grade,
      this.opticalSize,
      this.weight,
      this.semanticLabel,
      this.shadows,
      this.textDirection});

  @override
  Widget build(BuildContext context) {
    final iconSize = size?.toGSSize ?? iconStyle.props?.size;
    GSStyle styler = resolveStyles(
        context: context,
        styles: [
          iconStyle,
          iconStyle.sizeMap(iconSize),
        ],
        inlineStyle: style,
        isFirst: true);
    return Icon(
      icon,
      size: styler.width ?? styler.height,
      color: styler.color,
      fill: fill,
      grade: grade,
      opticalSize: opticalSize,
      semanticLabel: semanticLabel,
      shadows: shadows,
      textDirection: textDirection,
      weight: weight,
    );
  }
}
