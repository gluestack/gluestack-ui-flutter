import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertTextConfig = GSStyleConfig(
  componentName: 'AlertText',
  ancestorStyle: ['_text'],
);
final GSConfigStyle alertTextStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().alertText);
