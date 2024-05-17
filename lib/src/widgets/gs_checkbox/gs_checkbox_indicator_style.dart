import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxIndicatorConfig = GSStyleConfig(
    componentName: 'CheckboxIndicator', descendantStyle: ['_indicator']);

GSConfigStyle checkBoxIndicatorStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().checkboxIndicator);
