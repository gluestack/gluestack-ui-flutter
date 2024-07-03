import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSliderFilledTrackConfig = GSStyleConfig(
  componentName: 'SliderFilledTrack',
  ancestorStyle: ['_filledTrack'],
);
final GSConfigStyle sliderFilledTrackStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().sliderFilledTrack);
