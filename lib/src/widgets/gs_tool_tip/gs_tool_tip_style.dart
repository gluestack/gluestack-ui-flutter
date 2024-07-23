import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsToolTipConfig = GSStyleConfig(
  componentName: 'ToolTip',
);
final GSConfigStyle toolTipStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().toolTip);