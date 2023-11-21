import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_icon.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';

final GSStyle badgeIconStyle = GSStyle.fromMap(data: badgeIconData);
GSStyleConfig gsBadgeIconStyle =
    GSStyleConfig(componentName: 'BadgeIcon', ancestorStyle: ['_icon']);
    
class GSBadgeIconStyle {
  static Map<GSSizes, double?> size = {
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
  };
}