import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';

import 'package:gluestack_flutter_pro/theme/config/button/button_icon.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

GSStyle buttonIconStyle = GSStyle.fromMap(data: buttonIconData);
GSStyleConfig gsButtonIconStyle =
    GSStyleConfig(componentName: 'ButtonIcon', ancestorStyle: ['_icon']);

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
