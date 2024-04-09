import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperTitleTextConfig =
    GSStyleConfig(componentName: 'StepperTitle', ancestorStyle: ['_titleText']);

GSStyle gsStepperTitleTextStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().stepperTitleText);
