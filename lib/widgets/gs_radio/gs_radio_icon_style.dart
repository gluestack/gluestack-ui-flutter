import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_indicator.dart';
import 'package:gluestack_flutter_pro/token/font_size_token.dart';

GSStyleConfig gsRadioIconConfig =
    GSStyleConfig(componentName: 'RadioIcon', ancestorStyle: ['_icon']);
final GSStyle radioIconStyle = GSStyle.fromMap(data: radioIconData);
final GSStyle radioIndicatorStyle = GSStyle.fromMap(data: radioIndicatorData);

class GSRadioIconStyle {
  static Map<GSSizes, double?> iconSize = {
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl,
  };
}
