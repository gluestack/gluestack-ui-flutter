import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSpinnerConfig = GSStyleConfig(
  componentName: 'Spinner',
);
GSStyleInt spinnerStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().spinner);
