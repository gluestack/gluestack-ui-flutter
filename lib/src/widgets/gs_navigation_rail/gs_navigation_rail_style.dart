import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsNavigationRailConfig = GSStyleConfig(
  componentName: 'Navigation Rail',
  descendantStyle: [
    '_selectedLabelText',
    '_unselectedLabelText',
    '_selectedIcon',
    '_unselectedIcon'
  ],
);

final GSStyle gsNavigationRailStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().navigationRail,
    descendantStyle: gsNavigationRailConfig.descendantStyle);
