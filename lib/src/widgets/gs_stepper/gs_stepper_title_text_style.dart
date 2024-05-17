import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperTitleTextConfig =
    GSStyleConfig(componentName: 'StepperTitle', ancestorStyle: ['_titleText']);

GSConfigStyle gsStepperTitleTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().stepperTitleText);
