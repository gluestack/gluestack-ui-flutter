import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/text_area/text_area.dart';

const GSStyleConfig gsTextAreaConfig = GSStyleConfig(
  componentName: 'Textarea',
  descendantStyle: ['_input'],
);

GSStyle textAreaStyle = GSStyle.fromMap(
    data: textAreaData, descendantStyle: gsTextAreaConfig.descendantStyle);
