import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsModalCloseButtonConfig =
    GSStyleConfig(componentName: 'Modal', descendantStyle: ['_icon', '_text']);

final GSConfigStyle gsModalCloseButtonStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().modalCloseButton,
    descendantStyle: gsModalCloseButtonConfig.descendantStyle);
