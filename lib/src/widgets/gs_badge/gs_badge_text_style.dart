import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

/// Represents the style configuration for GSBadgeText.
final GSConfigStyle badgeTextStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().text).merge(
        GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().badgeText));

/// Needed configuration for descendantStyle, specifying the component name and ancestor style
const GSStyleConfig gsBadgeTextConfig = GSStyleConfig(
  componentName: 'BadgeText',
  ancestorStyle: ['_text'],
);
