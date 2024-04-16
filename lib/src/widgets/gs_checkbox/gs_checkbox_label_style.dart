import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxLabelConfig = GSStyleConfig(
  componentName: 'CheckboxLabel',
  ancestorStyle: ['_text'],
);

GSStyleInt checkBoxLabelStyle =

        GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().checkboxLabel);

class GSCheckBoxLabelStyle {
  static Map<GSSizes, GSStyleInt?> size = {
    GSSizes.$lg: checkBoxLabelStyle.variants?.size?.$lg,
    GSSizes.$md: checkBoxLabelStyle.variants?.size?.$md,
    GSSizes.$sm: checkBoxLabelStyle.variants?.size?.$sm,
  };
}
