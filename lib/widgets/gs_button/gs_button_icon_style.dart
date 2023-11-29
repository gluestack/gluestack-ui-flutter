import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';

import 'package:gluestack_flutter_pro/theme/config/button/button_icon.dart';
import 'package:gluestack_flutter_pro/token/index.dart';
import 'package:gluestack_flutter_pro/widgets/gs_button/button_styles_generated.dart';
GSStyleConfig gsButtonIconStyle =
    GSStyleConfig(componentName: 'ButtonIcon', ancestorStyle: ['_icon']);
// GSStyle buttonIconStyle = GSStyle.fromMap(data: buttonIconData);
GSStyle baseStyle = GSStyle(
  color: buttonIconStyle.color,
  dark: buttonIconStyle.dark,
);

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
