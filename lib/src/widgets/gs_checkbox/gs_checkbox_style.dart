import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxConfig = GSStyleConfig(
    componentName: 'Checkbox',
    descendantStyle: ['_icon', '_text', '_indicator']);

GSStyle checkboxStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().checkbox,
    descendantStyle: checkBoxConfig.descendantStyle);

// class GsCheckBoxStyle {
//   static Map<GSSizes, GSStyle?> size = {
//     GSSizes.$lg: checkboxStyle.variants?.size?.$lg,
//     GSSizes.$md: checkboxStyle.variants?.size?.$md,
//     GSSizes.$sm: checkboxStyle.variants?.size?.$sm,
//   };
// }
