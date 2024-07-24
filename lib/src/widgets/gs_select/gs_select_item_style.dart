import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectItemConfig = GSStyleConfig(
  componentName: 'SelectItem',
  descendantStyle: ['_text', '_icon']
);
final GSConfigStyle selectItemStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().selectItem);