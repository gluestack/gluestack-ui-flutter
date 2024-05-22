import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsProgressConfig = GSStyleConfig(
  componentName: 'Progress',
  descendantStyle: ['_filledTrack'],
);

GSConfigStyle progressStyle = GSConfigStyle.fromMap(
  data: getIt<GluestackCustomConfig>().progress,
  descendantStyle: gsProgressConfig.descendantStyle,
);
