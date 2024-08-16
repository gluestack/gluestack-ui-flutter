import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsModalConfig =
    GSStyleConfig(componentName: 'Modal', descendantStyle: ['_content']);
 GSConfigStyle modalStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().modal,
    descendantStyle: gsModalConfig.descendantStyle);
