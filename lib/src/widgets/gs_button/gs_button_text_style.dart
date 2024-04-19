import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsTextConfig =
    GSStyleConfig(componentName: 'ButtonText', ancestorStyle: ['_text']);

GSConfigStyle buttonTextStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().buttonText);
