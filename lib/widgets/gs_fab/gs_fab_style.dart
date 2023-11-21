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
    props: fabStyle.props,
    descendantStyles: fabStyle.descendantStyles);

class GSFabStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$sm: fabStyle.variants?.size?.$sm,
    GSSizes.$md: fabStyle.variants?.size?.$md,
    GSSizes.$lg: fabStyle.variants?.size?.$lg,
  };

  static Map<GSPlacements, GSStyle?> placementVariants = {
    GSPlacements.topLeft:
        baseFabStyle.merge(fabStyle.variants?.placements?.topLeft),
    GSPlacements.topRight:
        baseFabStyle.merge(fabStyle.variants?.placements?.topRight),
    GSPlacements.bottomRight:
        baseFabStyle.merge(fabStyle.variants?.placements?.bottomRight),
    GSPlacements.bottomLeft:
        baseFabStyle.merge(fabStyle.variants?.placements?.bottomLeft),
    GSPlacements.topCenter:
        baseFabStyle.merge(fabStyle.variants?.placements?.topCenter),
    GSPlacements.bottomCenter:
        baseFabStyle.merge(fabStyle.variants?.placements?.bottomCenter),
  };
}
