import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperSubtitleTextConfig = GSStyleConfig(
    componentName: 'StepperTitle', ancestorStyle: ['_subtitleText']);

GSConfigStyle gsStepperSubtitleTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().stepperTitleText);
