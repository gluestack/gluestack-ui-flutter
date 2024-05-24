import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkboxIconConfig =
    GSStyleConfig(componentName: 'CheckboxIcon', ancestorStyle: ['_icon']);

GSConfigStyle checkboxIconStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().icon).merge(
        GSConfigStyle.fromMap(
            data: getIt<GluestackCustomConfig>().checkboxIcon));

// class GSCheckBoxIconStyle {
//   static Map<GSSizes, GSStyle?> size = {
//     GSSizes.$2xs: checkboxIconStyle.variants?.size?.$2xs,
//     GSSizes.$xs: checkboxIconStyle.variants?.size?.$xs,
//     GSSizes.$sm: checkboxIconStyle.variants?.size?.$sm,
//     GSSizes.$md: checkboxIconStyle.variants?.size?.$md,
//     GSSizes.$lg: checkboxIconStyle.variants?.size?.$lg,
//     GSSizes.$xl: checkboxIconStyle.variants?.size?.$xl,
//   };
// }
