import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSliderConfig = GSStyleConfig(
    componentName: 'Slider',
    descendantStyle: ['_thumb', '_track', '_filledTrack']);
     GSConfigStyle sliderStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().slider,
    descendantStyle: gsSliderConfig.descendantStyle);


