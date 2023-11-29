import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox_label.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';

GSStyleConfig checkBoxLabelConfig =
    GSStyleConfig(componentName: 'CheckboxLabel', ancestorStyle: ['_text']);

GSStyle checkBoxLabelStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: checkBoxLabelData));

class GSCheckBoxLabelStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$lg: checkBoxLabelStyle.variants?.size?.$lg,
    GSSizes.$md: checkBoxLabelStyle.variants?.size?.$md,
    GSSizes.$sm: checkBoxLabelStyle.variants?.size?.$sm,
  };
}
