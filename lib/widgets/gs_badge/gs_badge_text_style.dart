import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/badge/badge_text.dart';

final GSStyle badgeTextStyle = GSStyle.fromMap(data: badgeTextData);

GSStyleConfig gsBadgeTextConfig =
    GSStyleConfig(componentName: 'BadgeText', ancestorStyle: ['_text']);
