import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxLabelConfig = GSStyleConfig(
  componentName: 'CheckboxLabel',
  ancestorStyle: ['_text'],
);

GSConfigStyle checkBoxLabelStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().text).merge(
        GSConfigStyle.fromMap(
            data: getIt<GluestackCustomConfig>().checkboxLabel));

// class GSCheckBoxLabelStyle {
//   static Map<GSSizes, GSStyle?> size = {
//     GSSizes.$lg: checkBoxLabelStyle.variants?.size?.$lg,
//     GSSizes.$md: checkBoxLabelStyle.variants?.size?.$md,
//     GSSizes.$sm: checkBoxLabelStyle.variants?.size?.$sm,
//   };
// }
