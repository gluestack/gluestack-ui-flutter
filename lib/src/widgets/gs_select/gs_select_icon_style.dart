import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectIconConfig = GSStyleConfig(
  componentName: 'SelectIcon',
);
final GSConfigStyle selectIconStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().selectIcon);