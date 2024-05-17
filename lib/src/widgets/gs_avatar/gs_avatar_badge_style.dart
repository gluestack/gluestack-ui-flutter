import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSConfigStyle avatarBadgeStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().avatarBadge);

const GSStyleConfig gsAvatarBadgeStyle =
    GSStyleConfig(componentName: 'AvatarBadge', ancestorStyle: ['_badge']);
