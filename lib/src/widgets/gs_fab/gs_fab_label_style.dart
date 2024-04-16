import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyleConfig fabLabelConfig =
    const GSStyleConfig(componentName: 'FabLabel', ancestorStyle: ['_text']);

GSStyleInt fabLabelStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().fabLabel,
    descendantStyle: fabLabelConfig.descendantStyle);
