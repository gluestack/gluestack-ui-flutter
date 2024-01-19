import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyle avatarFallBackStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().text).merge(
        GSStyle.fromMap(
            data: getIt<GluestackCustomConfig>().avatarFallbackText));
GSStyleConfig gsAvatarFallbackTextConfig = const GSStyleConfig(
    componentName: 'AvatarFallbackText', ancestorStyle: ['_text']);
