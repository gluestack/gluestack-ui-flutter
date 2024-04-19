import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioTextConfig = GSStyleConfig(
  componentName: 'RadioLabel',
  ancestorStyle: ['_text'],
);

final GSConfigStyle radioLabelStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().text).merge(
        GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().radioText));
