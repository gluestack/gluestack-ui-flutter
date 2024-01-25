import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSpinnerConfig = GSStyleConfig(
  componentName: 'Spinner',
);
GSStyle spinnerStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().spinner);
