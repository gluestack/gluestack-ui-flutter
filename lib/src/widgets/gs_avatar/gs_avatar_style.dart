import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAvatarConfig = GSStyleConfig(
  componentName: 'Avatar',
  descendantStyle: ['_badge', '_text'],
  ancestorStyle: ['_avatar'],
);

GSStyle avatarStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().avatar,
    descendantStyle: gsAvatarConfig.descendantStyle);

class GSAvatarStyle {
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
