import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSConfigStyle avatarFallBackStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().text).merge(
        GSConfigStyle.fromMap(
            data: getIt<GluestackCustomConfig>().avatarFallbackText));
GSStyleConfig gsAvatarFallbackTextConfig = const GSStyleConfig(
    componentName: 'AvatarFallbackText', ancestorStyle: ['_text']);
