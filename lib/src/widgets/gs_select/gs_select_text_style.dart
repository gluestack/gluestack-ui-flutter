import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectTextConfig = GSStyleConfig(
  componentName: 'SelectText',
   ancestorStyle: ['_text'],
);
final GSConfigStyle selectTextStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().selectText);
