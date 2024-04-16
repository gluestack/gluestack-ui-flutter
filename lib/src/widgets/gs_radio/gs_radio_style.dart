import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioConfig = GSStyleConfig(
    componentName: 'Radio',
    ancestorStyle: ['_radio'],
    descendantStyle: ['_icon', '_text', '_indicator']);

final GSStyleInt radioStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().radio,
    descendantStyle: gsRadioConfig.descendantStyle);

class GSRadioStyles {
  static Map<GSSizes, Map<String, GSStyleInt?>> radioDescendantStyles = {
    GSSizes.$sm: radioStyle.variants!.size!.$sm!.descendantStyles!,
    GSSizes.$md: radioStyle.variants!.size!.$md!.descendantStyles!,
    GSSizes.$lg: radioStyle.variants!.size!.$lg!.descendantStyles!,
  };
}
