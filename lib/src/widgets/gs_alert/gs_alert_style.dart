import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertConfig = GSStyleConfig(
  componentName: 'Alert',
  descendantStyle: ['_icon', '_text'],
);
final GSConfigStyle alertStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().alert,
    descendantStyle: gsAlertConfig.descendantStyle);
