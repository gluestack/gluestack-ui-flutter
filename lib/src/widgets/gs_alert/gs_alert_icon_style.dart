import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

final GSConfigStyle alertIconStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().alertIcon);

const GSStyleConfig gsAlertIconConfig =
    GSStyleConfig(componentName: 'AlertIcon', ancestorStyle: ['_icon']);

class GSAlertBoxIconStyle {
  static Map<GSSizes, double?> size = {
    GSSizes.$2xs: $GSFontSize.$2xs,
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl
  };
}
