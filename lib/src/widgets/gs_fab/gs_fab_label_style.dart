

import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/fab/label.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';

GSStyleConfig fabLabelConfig =
  const  GSStyleConfig(componentName: 'FabLabel', ancestorStyle: ['_text']);

GSStyle fabLabelStyle = GSStyle.fromMap(data: textData).merge(
    GSStyle.fromMap(data: fabLabelData),
    descendantStyleKeys: fabLabelConfig.descendantStyle);
