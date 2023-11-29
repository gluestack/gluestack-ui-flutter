import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox.dart';

GSStyleConfig checkBoxConfig = GSStyleConfig(
    componentName: 'Checkbox',
    descendantStyle: ['_icon', '_text', '_indicator']);

GSStyle checkboxStyle = GSStyle.fromMap(
    data: checkBoxData, descendantStyle: checkBoxConfig.descendantStyle);

    

class GsCheckBoxStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$lg:checkboxStyle.variants?.size?.$lg,
    GSSizes.$md:checkboxStyle.variants?.size?.$md,
    GSSizes.$sm:checkboxStyle.variants?.size?.$sm,
  };
}
