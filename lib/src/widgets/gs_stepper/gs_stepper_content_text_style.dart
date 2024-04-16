import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperContentTextConfig = GSStyleConfig(
    componentName: 'StepperTitle', ancestorStyle: ['_contentText']);

GSStyleInt gsStepperContentTextStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().stepperContentText);
