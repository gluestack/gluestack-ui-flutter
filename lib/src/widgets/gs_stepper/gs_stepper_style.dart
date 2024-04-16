import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

import '../../style/gs_style_config.dart';

const GSStyleConfig gsStepperConfig = GSStyleConfig(
  componentName: 'Stepper',
  descendantStyle: ['_titleText', '_subtitleText', '_contentText', '_icon'],
);

 GSStyleInt gsStepperStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().stepper,
    descendantStyle: gsStepperConfig.descendantStyle);

// GSStyle baseStyle = GSStyle(
//   bg: gsStepperStyle.bg,
//   dark: GSStyle(bg: gsStepperStyle.bg),
// );


