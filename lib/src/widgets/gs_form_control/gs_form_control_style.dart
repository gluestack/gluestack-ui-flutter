import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsFromControlConfig = GSStyleConfig(
  componentName: 'FormControl',
  descendantStyle: ['_labelText', '_helperText', '_errorText', '_labelAstrick'],
);

final formControlStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().form,
    descendantStyle: gsFromControlConfig.descendantStyle);
