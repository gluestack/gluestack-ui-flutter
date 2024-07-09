import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsToolTipTextConfig =
    GSStyleConfig(componentName: 'ToolTipText', descendantStyle: ['_text']);
final GSConfigStyle toolTipTextStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().toolTipText);