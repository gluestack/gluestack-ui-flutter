import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsStepperSubtitleTextConfig = GSStyleConfig(
    componentName: 'StepperTitle', ancestorStyle: ['_subtitleText']);

GSStyleInt gsStepperSubtitleTextStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().stepperTitleText);
