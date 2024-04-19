import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsNavigationRailSelectedLabelTextConfig = GSStyleConfig(
    componentName: 'SelectedLabelText', ancestorStyle: ['_selectedLabelText']);

GSConfigStyle gsNavigationRailSelectedLabelTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().navigationRailSelectedLableText);
