import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSpinnerConfig = GSStyleConfig(
  componentName: 'Spinner',
);
GSConfigStyle spinnerStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().spinner);
