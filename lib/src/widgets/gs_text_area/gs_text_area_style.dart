import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/text_area/text_area.dart';

GSStyleConfig gsTextAreaConfig = GSStyleConfig(
  componentName: 'Textarea',
  descendantStyle: ['_input'],
);

GSStyle textAreaStyle = GSStyle.fromMap(
    data: textAreaData, descendantStyle: gsTextAreaConfig.descendantStyle);

class GSTextAreaStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: textAreaStyle.variants!.size!.$sm!,
    GSSizes.$md: textAreaStyle.variants!.size!.$md!,
    GSSizes.$lg: textAreaStyle.variants!.size!.$lg!,
    GSSizes.$xl: textAreaStyle.variants!.size!.$xl!,
  };
}
