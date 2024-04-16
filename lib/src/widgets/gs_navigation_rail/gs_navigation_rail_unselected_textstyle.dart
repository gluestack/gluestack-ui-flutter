import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsNavigationRailUnselectedLabelTextConfig = GSStyleConfig(
    componentName: 'UnselectedLabelText',
    ancestorStyle: ['_unselectedLabelText']);

GSStyleInt gsNavigationRailUnselectedLabelTextStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().navigationRailUnselectedLableText);
