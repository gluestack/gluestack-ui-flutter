import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyleConfig gsButtonIconStyle =
    const GSStyleConfig(componentName: 'ButtonIcon', ancestorStyle: ['_icon']);
GSConfigStyle buttonIconStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().icon).merge(
        GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().buttonIcon));

class GSButtonIconStyle {
  static Map<GSSizes, double?> size = {
    GSSizes.$2xs: $GSFontSize.$2xs,
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl
  };
}
