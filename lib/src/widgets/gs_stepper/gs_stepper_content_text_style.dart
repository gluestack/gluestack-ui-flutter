import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperContentTextConfig = GSStyleConfig(
    componentName: 'StepperTitle', ancestorStyle: ['_contentText']);

GSStyle gsStepperContentTextStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().stepperContentText);
