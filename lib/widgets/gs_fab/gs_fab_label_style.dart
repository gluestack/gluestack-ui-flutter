import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/fab/label.dart';
import 'package:gluestack_flutter_pro/theme/config/text/text.dart';

GSStyleConfig fabLabelConfig =
    GSStyleConfig(componentName: 'FabLabel', ancestorStyle: ['_text']);

GSStyle fabLabelStyle = GSStyle.fromMap(data: textData).merge(
    GSStyle.fromMap(data: fabLabelData),
    descendantStyleKeys: fabLabelConfig.descendantStyle);
