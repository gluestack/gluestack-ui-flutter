import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/token/public.dart';

GSStyleConfig gsButtonIconStyle =
    const GSStyleConfig(componentName: 'ButtonIcon', ancestorStyle: ['_icon']);
GSStyle buttonIconStyle = GSStyle.fromMap(
        data: getIt<GluestackCustomConfig>().icon)
    .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().buttonIcon));

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
