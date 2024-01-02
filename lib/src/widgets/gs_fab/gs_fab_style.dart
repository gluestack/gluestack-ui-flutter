import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyleConfig fabConfig = const GSStyleConfig(
    componentName: 'Fab', descendantStyle: ['_text', '_icon']);

GSStyle fabStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().fab,
    descendantStyle: fabConfig.descendantStyle);

GSStyle baseFabStyle = GSStyle(
    bg: fabStyle.bg,
    borderRadius: fabStyle.borderRadius,
    onHover: fabStyle.onHover,
    onActive: fabStyle.onActive,
    onDisabled: fabStyle.onDisabled,
    props: fabStyle.props,
    flexDirection: fabStyle.flexDirection,
    alignItems: fabStyle.alignItems,
    onFocus: fabStyle.onFocus,
    justifyContent: fabStyle.justifyContent,
    dark: fabStyle.dark,
    descendantStyles: fabStyle.descendantStyles);

class GSFabStyle {
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
