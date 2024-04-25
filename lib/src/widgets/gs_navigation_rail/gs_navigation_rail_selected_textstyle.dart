import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsNavigationRailSelectedLabelTextConfig = GSStyleConfig(
    componentName: 'SelectedLabelText', ancestorStyle: ['_selectedLabelText']);

GSStyle gsNavigationRailSelectedLabelTextStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().navigationRailSelectedLableText);
