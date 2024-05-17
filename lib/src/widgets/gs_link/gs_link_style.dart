import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsLinkConfig = GSStyleConfig(
  componentName: 'Link',
  descendantStyle: ['_text'],
);

GSConfigStyle linkStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().link,
    descendantStyle: gsLinkConfig.descendantStyle);
