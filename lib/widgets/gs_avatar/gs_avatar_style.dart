import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar.dart';

GSStyleConfig gsAvatarConfig = GSStyleConfig(
  componentName: 'Avatar',
  descendantStyle: ['_badge', '_text'],
  ancestorStyle: ['_avatar'],
);

GSStyle avatarStyle = GSStyle.fromMap(
    data: avatarData, descendantStyle: gsAvatarConfig.descendantStyle);

class GSAvatarStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: avatarStyle.variants!.size!.$xs!,
    GSSizes.$sm: avatarStyle.variants!.size!.$sm!,
    GSSizes.$md: avatarStyle.variants!.size!.$md!,
    GSSizes.$lg: avatarStyle.variants!.size!.$lg!,
    GSSizes.$xl: avatarStyle.variants!.size!.$xl!,
    GSSizes.$2xl: avatarStyle.variants!.size!.$2xl!,
  };

  static Map<GSBorderRadius, double> borderRadius = {
    GSBorderRadius.$none: 0,
    GSBorderRadius.$xs: 2,
    GSBorderRadius.$sm: 4,
    GSBorderRadius.$md: 6,
    GSBorderRadius.$lg: 6,
    GSBorderRadius.$xl: 12,
    GSBorderRadius.$2xl: 16,
    GSBorderRadius.$3xl: 24,
    GSBorderRadius.$full: 999,
  };
}
