import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio.dart';

const GSStyleConfig gsRadioConfig = GSStyleConfig(
    componentName: 'Radio',
    ancestorStyle: ['_radio'],
    descendantStyle: ['_icon', '_text', '_indicator']);

final GSStyle radioStyle = GSStyle.fromMap(
    data: radioData, descendantStyle: gsRadioConfig.descendantStyle);

class GSRadioStyles {
  static Map<GSSizes, Map<String, GSStyle?>> radioDescendantStyles = {
    GSSizes.$sm: radioStyle.variants!.size!.$sm!.descendantStyles!,
    GSSizes.$md: radioStyle.variants!.size!.$md!.descendantStyles!,
    GSSizes.$lg: radioStyle.variants!.size!.$lg!.descendantStyles!,
  };
}
