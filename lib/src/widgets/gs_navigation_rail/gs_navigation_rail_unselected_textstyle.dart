import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsNavigationRailUnselectedLabelTextConfig = GSStyleConfig(
    componentName: 'UnselectedLabelText',
    ancestorStyle: ['_unselectedLabelText']);

GSConfigStyle gsNavigationRailUnselectedLabelTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().navigationRailUnselectedLableText);
