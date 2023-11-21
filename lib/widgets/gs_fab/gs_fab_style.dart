import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/fab/fab.dart';

GSStyleConfig fabConfig =
    GSStyleConfig(componentName: 'Fab', descendantStyle: ['_text', '_icon']);

GSStyle fabStyle =
    GSStyle.fromMap(data: fabData, descendantStyle: fabConfig.descendantStyle);

GSStyle baseFabStyle = GSStyle(
  bg: fabStyle.bg,
  borderRadius: fabStyle.borderRadius,
  onHover: fabStyle.onHover,
  onActive: fabStyle.onActive,
  onDisabled: fabStyle.onDisabled,
  descendantStyles: fabStyle.descendantStyles
);

class GSFabStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$sm: fabStyle.variants?.size?.$sm,
    GSSizes.$md: fabStyle.variants?.size?.$md,
    GSSizes.$lg: fabStyle.variants?.size?.$lg,
  };

  static Map<GSSize, GSStyle?> placementVariants = {};
}
