import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperSubtitleTextConfig = GSStyleConfig(
    componentName: 'StepperTitle', ancestorStyle: ['_subtitleText']);

GSStyle gsStepperSubtitleTextStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().stepperTitleText);
