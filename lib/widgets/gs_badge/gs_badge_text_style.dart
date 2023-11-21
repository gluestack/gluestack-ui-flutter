import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_text.dart';

/// Represents the style configuration for GSBadgeText.
final GSStyle badgeTextStyle = GSStyle.fromMap(data: badgeTextData);

/// Needed configuration for descendantStyle, specifying the component name and ancestor style
GSStyleConfig gsBadgeTextConfig =
    GSStyleConfig(componentName: 'BadgeText', ancestorStyle: ['_text']);
