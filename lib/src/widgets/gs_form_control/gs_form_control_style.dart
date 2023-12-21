import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control.dart';

const GSStyleConfig gsFromControlConfig = GSStyleConfig(
  componentName: 'FormControl',
  descendantStyle: ['_labelText', '_helperText', '_errorText', '_labelAstrick'],
);

final formControlStyle = GSStyle.fromMap(
    data: formControlData,
    descendantStyle: gsFromControlConfig.descendantStyle);

class GSFormControlStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: formControlStyle.variants!.size!.$sm!,
    GSSizes.$md: formControlStyle.variants!.size!.$md!,
    GSSizes.$lg: formControlStyle.variants!.size!.$lg!,
  };
}
