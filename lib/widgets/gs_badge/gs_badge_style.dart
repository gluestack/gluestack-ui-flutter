import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_text.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';

final GSStyle badgeStyle = GSStyle.fromMap(data: badgeData);
final GSStyle badgeIconStyle = GSStyle.fromMap(data: badgeIconData);
final GSStyle badgeTextStyle = GSStyle.fromMap(data: badgeTextData);

class GSBadgeTextStyle {
  static Map<GSSizes, double?> textSize = {
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl,
  };
}