import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsLinkConfig = GSStyleConfig(
  componentName: 'Link',
  descendantStyle: ['_text'],
);

GSStyleInt linkStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().link,
    descendantStyle: gsLinkConfig.descendantStyle);
