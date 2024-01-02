import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyleConfig gsfabIconConfig =
    const GSStyleConfig(componentName: 'FabIcon', ancestorStyle: ['_icon']);

GSStyle fabIconStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().icon)
        .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().fabIcon));

class GSFabIconStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$2xs: fabIconStyle.variants?.size?.$2xs,
    GSSizes.$xs: fabIconStyle.variants?.size?.$xs,
    GSSizes.$sm: fabIconStyle.variants?.size?.$sm,
    GSSizes.$md: fabIconStyle.variants?.size?.$md,
    GSSizes.$lg: fabIconStyle.variants?.size?.$lg,
    GSSizes.$xl: fabIconStyle.variants?.size?.$xl,
  };
}
