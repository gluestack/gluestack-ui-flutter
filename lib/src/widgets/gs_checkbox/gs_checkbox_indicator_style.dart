import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxIndicatorConfig = GSStyleConfig(
    componentName: 'CheckboxIndicator', descendantStyle: ['_indicator']);

GSStyle checkBoxIndicatorStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().checkboxIndicator);
