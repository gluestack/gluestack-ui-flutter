import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxConfig = GSStyleConfig(
    componentName: 'Checkbox',
    descendantStyle: ['_icon', '_text', '_indicator']);

GSStyleInt checkboxStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().checkbox,
    descendantStyle: checkBoxConfig.descendantStyle);

class GsCheckBoxStyle {
  static Map<GSSizes, GSStyleInt?> size = {
    GSSizes.$lg: checkboxStyle.variants?.size?.$lg,
    GSSizes.$md: checkboxStyle.variants?.size?.$md,
    GSSizes.$sm: checkboxStyle.variants?.size?.$sm,
  };
}
