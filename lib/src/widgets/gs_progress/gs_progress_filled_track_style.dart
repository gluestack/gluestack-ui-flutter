import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsProgressFilledTrackConfig = GSStyleConfig(
  componentName: 'ProgressFilledTrack',
  ancestorStyle: ['_filledTrack'],
);

GSConfigStyle progressFilledTrackStyle = GSConfigStyle.fromMap(
  data: getIt<GluestackCustomConfig>().progressFilledTrack,
);
