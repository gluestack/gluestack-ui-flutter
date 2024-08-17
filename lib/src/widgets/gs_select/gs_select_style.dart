import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectConfig = GSStyleConfig(
  componentName: 'Select',
);
final GSConfigStyle selectStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().select);