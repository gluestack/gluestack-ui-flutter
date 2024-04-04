import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsNavigationRailUnselectedLabelTextConfig = GSStyleConfig(
    componentName: 'UnselectedLabelText',
    ancestorStyle: ['_unselectedLabelText']);

GSStyle gsNavigationRailUnselectedLabelTextStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().navigationRailUnselectedLableText);
