import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox_icon.dart';
import 'package:gluestack_ui/src/theme/config/icon/icon.dart';

GSStyleConfig checkboxIconConfig =
    GSStyleConfig(componentName: 'CheckboxIcon', ancestorStyle: ['_icon']);

GSStyle checkboxIconStyle = GSStyle.fromMap(data: iconData)
    .merge(GSStyle.fromMap(data: checkBoxIconData));

class GSCheckBoxIconStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$2xs: checkboxIconStyle.variants?.size?.$2xs,
    GSSizes.$xs: checkboxIconStyle.variants?.size?.$xs,
    GSSizes.$sm: checkboxIconStyle.variants?.size?.$sm,
    GSSizes.$md: checkboxIconStyle.variants?.size?.$md,
    GSSizes.$lg: checkboxIconStyle.variants?.size?.$lg,
    GSSizes.$xl: checkboxIconStyle.variants?.size?.$xl,
  };
}
