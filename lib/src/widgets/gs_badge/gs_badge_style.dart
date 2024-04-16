import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

// GSStyleConfig for the Badge component | needed for descendantStyle
const GSStyleConfig gsBadgeConfig = GSStyleConfig(
  componentName: 'Badge',
  descendantStyle: ['_text', '_icon'],
);

// GSStyle representing the base style for the Badge
final GSStyleInt badgeStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().badge,
    descendantStyle: gsBadgeConfig.descendantStyle);

// // GSBadgeStyle class to define badge styles
class GSBadgeStyle {
  static Map<GSBorderRadius, double> radius = {
    GSBorderRadius.$none: $GSRadii.none,
    GSBorderRadius.$xs: $GSRadii.$xs,
    GSBorderRadius.$sm: $GSRadii.$sm,
    GSBorderRadius.$md: $GSRadii.$md,
    GSBorderRadius.$lg: $GSRadii.$lg,
    GSBorderRadius.$xl: $GSRadii.$xl,
    GSBorderRadius.$2xl: $GSRadii.$2xl,
    GSBorderRadius.$3xl: $GSRadii.$3xl,
    GSBorderRadius.$full: $GSRadii.full,
  };
}
