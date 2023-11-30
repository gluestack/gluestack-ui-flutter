import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/avatar/avatar_badge.dart';

GSStyle avatarBadgeStyle = GSStyle.fromMap(data: avatarBadgeData);

const GSStyleConfig gsAvatarBadgeStyle =
    GSStyleConfig(componentName: 'AvatarBadge', ancestorStyle: ['_badge']);
