import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsToolTipContextConfig =
    GSStyleConfig(componentName: 'ToolTipContent', ancestorStyle: ['_text']);
final GSConfigStyle toolTipContentStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().toolTipContent);