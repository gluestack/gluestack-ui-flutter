import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox_indicator.dart';

GSStyleConfig checkBoxIndicatorConfig = GSStyleConfig(
    componentName: 'CheckboxIndicator', descendantStyle: ['_indicator']);

GSStyle checkBoxIndicatorStyle = GSStyle.fromMap(data: checkBoxIndicatorData);
