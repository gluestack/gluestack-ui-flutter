import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxLabelConfig = GSStyleConfig(
  componentName: 'CheckboxLabel',
  ancestorStyle: ['_text'],
);

GSStyle checkBoxLabelStyle = GSStyle.fromMap(
        data: getIt<GluestackCustomConfig>().text)
    .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().checkboxLabel));

class GSCheckBoxLabelStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$lg: checkBoxLabelStyle.variants?.size?.$lg,
    GSSizes.$md: checkBoxLabelStyle.variants?.size?.$md,
    GSSizes.$sm: checkBoxLabelStyle.variants?.size?.$sm,
  };
}
