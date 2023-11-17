import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/checkbox/checkbox_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/icon/icon.dart';

GSStyleConfig checkboxIconConfig =
    GSStyleConfig(componentName: 'CheckboxIcon', ancestorStyle: ['_icon']);

GSStyle checkboxIconStyle = GSStyle.fromMap(data: iconData)
    .merge(GSStyle.fromMap(data: checkBoxIconData));
