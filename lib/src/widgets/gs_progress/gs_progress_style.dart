import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsProgressConfig = GSStyleConfig(
  componentName: 'Progress',
  descendantStyle: ['_filledTrack'],
);

GSStyle progressStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().progress,
    descendantStyle: gsProgressConfig.descendantStyle);
