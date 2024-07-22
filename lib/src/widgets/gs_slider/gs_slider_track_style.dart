import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSliderTrackConfig = GSStyleConfig(
  componentName: 'SliderTrack',
  ancestorStyle: ['_track'],
);
final GSConfigStyle sliderTrackStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().sliderTrack);
