import 'package:flutter/material.dart';

enum GSBadgeActionsCopy { error, warning, success, info, muted }

enum GSBadgeVariantsCopy { solid, outline }

enum GSBadgeSizesCopy { sm, md, lg }

enum GSBadgeRadiusCopy { none, xs, sm, md, lg, xl, xxl, xxxl, full }

// Action Styles
class GSBadgeActionStyle {
  final Color bg;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;

  const GSBadgeActionStyle({
    required this.bg,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
  });
}

// Variant Styles
class GSBadgeVariantStyle {
  final double? borderWidth;

  const GSBadgeVariantStyle({this.borderWidth});
}

// Size Styles
class GSBadgeSizeStyle {
  final double px;
  final double py;
  final double iconSize;
  final double textSize;

  const GSBadgeSizeStyle({
    required this.px,
    required this.py,
    required this.iconSize,
    required this.textSize,
  });
}

class GSBadgeStyles {
  static const Map<GSBadgeActionsCopy, GSBadgeActionStyle> actionStyles = {
    GSBadgeActionsCopy.error: GSBadgeActionStyle(
      bg: Color(0xFFe53e3e),
      borderColor: Color(0xFFfc8181),
      iconColor: Color(0xFFc53030),
      textColor: Color(0xFFc53030),
    ),
    GSBadgeActionsCopy.warning: GSBadgeActionStyle(
      bg: Color(0xFFfaf089),
      borderColor: Color(0xFFf6e05e),
      iconColor: Color(0xFFd69e2e),
      textColor: Color(0xFFd69e2e),
    ),
    GSBadgeActionsCopy.success: GSBadgeActionStyle(
      bg: Color(0xFF68d391),
      borderColor: Color(0xFF48bb78),
      iconColor: Color(0xFF2f855a),
      textColor: Color(0xFF2f855a),
    ),
    GSBadgeActionsCopy.info: GSBadgeActionStyle(
      bg: Color(0xFFbee3f8),
      borderColor: Color(0xFF90cdf4),
      iconColor: Color(0xFF3182ce),
      textColor: Color(0xFF3182ce),
    ),
    GSBadgeActionsCopy.muted: GSBadgeActionStyle(
      bg: Color(0xFFe2e8f0),
      borderColor: Color(0xFFcbd5e0),
      iconColor: Color(0xFFa0aec0),
      textColor: Color(0xFFa0aec0),
    ),
  };

  static const Map<GSBadgeVariantsCopy, GSBadgeVariantStyle> variantStyles = {
    GSBadgeVariantsCopy.solid: GSBadgeVariantStyle(),
    GSBadgeVariantsCopy.outline: GSBadgeVariantStyle(borderWidth: 1.0),
  };

  static const Map<GSBadgeSizesCopy, GSBadgeSizeStyle> sizeStyles = {
    GSBadgeSizesCopy.sm: GSBadgeSizeStyle(
      px: 8.0,
      py: 4.0,
      iconSize: 12.0,
      textSize: 12.0,
    ),
    GSBadgeSizesCopy.md: GSBadgeSizeStyle(
      px: 10.0,
      py: 6.0,
      iconSize: 14.0,
      textSize: 14.0,
    ),
    GSBadgeSizesCopy.lg: GSBadgeSizeStyle(
      px: 12.0,
      py: 8.0,
      iconSize: 16.0,
      textSize: 16.0,
    ),
  };
}

class GSBadgeCopy extends StatelessWidget {
  final GSBadgeActionsCopy? action;
  final GSBadgeVariantsCopy? variant;
  final GSBadgeSizesCopy? size;
  final GSBadgeRadiusCopy? borderRadius;
  final Widget? child;
  final Widget? icon;
  final String text;

  //load deafult values
  const GSBadgeCopy({
    super.key,
    this.action = GSBadgeActionsCopy.info,
    this.variant = GSBadgeVariantsCopy.solid,
    this.size = GSBadgeSizesCopy.md,
    this.borderRadius = GSBadgeRadiusCopy.none,
    this.child,
    this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final actionStyle = GSBadgeStyles.actionStyles[action]!;
    final variantStyle = GSBadgeStyles.variantStyles[variant]!;
    final sizeStyle = GSBadgeStyles.sizeStyles[size]!;

    return Container(
      decoration: BoxDecoration(
        color: actionStyle.bg,
        borderRadius:
            BorderRadius.circular(_getBorderRadiusValue(borderRadius!)),
        border: variant == GSBadgeVariantsCopy.outline
            ? Border.all(
                color: actionStyle.borderColor,
                width: variantStyle.borderWidth!)
            : null,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: sizeStyle.px, vertical: sizeStyle.py),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
                color: actionStyle.textColor, fontSize: sizeStyle.textSize),
          ),
          if (icon != null) ...[
            const SizedBox(width: 4),
            IconTheme(
              data: IconThemeData(
                  color: actionStyle.iconColor, size: sizeStyle.iconSize),
              child: icon!,
            ),
          ],
        ],
      ),
    );
  }

  double _getBorderRadiusValue(GSBadgeRadiusCopy radius) {
    switch (radius) {
      case GSBadgeRadiusCopy.none:
        return 0.0;
      case GSBadgeRadiusCopy.xs:
        return 2.0;
      case GSBadgeRadiusCopy.sm:
        return 4.0;
      case GSBadgeRadiusCopy.md:
        return 6.0;
      case GSBadgeRadiusCopy.lg:
        return 8.0;
      case GSBadgeRadiusCopy.xl:
        return 10.0;
      case GSBadgeRadiusCopy.xxl:
        return 12.0;
      case GSBadgeRadiusCopy.xxxl:
        return 14.0;
      case GSBadgeRadiusCopy.full:
        return 16.0;
      default:
        return 0.0;
    }
  }
}
