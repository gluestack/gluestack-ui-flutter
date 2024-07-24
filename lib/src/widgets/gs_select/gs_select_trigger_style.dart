import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectTriggerConfig = GSStyleConfig(
  componentName: 'SelectTrigger',
  descendantStyle: ['_input', '_icon'],
);
final GSConfigStyle selectTriggerStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().selectTrigger);
