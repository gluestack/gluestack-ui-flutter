import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsTextAreaConfig = GSStyleConfig(
  componentName: 'Textarea',
  descendantStyle: ['_input'],
);

GSConfigStyle textAreaStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().textArea,
    descendantStyle: gsTextAreaConfig.descendantStyle);
