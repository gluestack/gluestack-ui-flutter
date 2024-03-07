import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

final GSStyle gsStepperStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().stepper);

GSStyle baseStyle = GSStyle(
  bg: gsStepperStyle.bg,
  dark: GSStyle(bg: gsStepperStyle.bg),
);
