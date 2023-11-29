import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/icon/icon.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio_icon.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio_indicator.dart';


GSStyleConfig gsRadioIconConfig =
    GSStyleConfig(componentName: 'RadioIcon', ancestorStyle: ['_icon']);
    
final GSStyle radioIconStyle = GSStyle.fromMap(data: iconData).merge(GSStyle.fromMap(data: radioIconData));
final GSStyle radioIndicatorStyle = GSStyle.fromMap(data: radioIndicatorData);

class GSRadioIconStyle {
   static Map<GSSizes, GSStyle?> size = {
    GSSizes.$2xs: radioIconStyle.variants?.size?.$2xs,
    GSSizes.$xs: radioIconStyle.variants?.size?.$xs,
    GSSizes.$sm: radioIconStyle.variants?.size?.$sm,
    GSSizes.$md: radioIconStyle.variants?.size?.$md,
    GSSizes.$lg: radioIconStyle.variants?.size?.$lg,
    GSSizes.$xl: radioIconStyle.variants?.size?.$xl,
  };
}
