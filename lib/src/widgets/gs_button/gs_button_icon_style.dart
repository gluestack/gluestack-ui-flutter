import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

import 'package:gluestack_ui/src/theme/config/button/button_icon.dart';
import 'package:gluestack_ui/src/theme/config/icon/icon.dart';
import 'package:gluestack_ui/src/token/public.dart';

GSStyleConfig gsButtonIconStyle =
    const GSStyleConfig(componentName: 'ButtonIcon', ancestorStyle: ['_icon']);
GSStyle buttonIconStyle = GSStyle.fromMap(data: iconData).merge(GSStyle.fromMap(data: buttonIconData));

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
