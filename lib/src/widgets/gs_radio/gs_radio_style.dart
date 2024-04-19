import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioConfig = GSStyleConfig(
    componentName: 'Radio',
    ancestorStyle: ['_radio'],
    descendantStyle: ['_icon', '_text', '_indicator']);

final GSConfigStyle radioStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().radio,
    descendantStyle: gsRadioConfig.descendantStyle);

// class GSRadioStyles {
//   static Map<GSSizes, Map<String, GSStyle?>> radioDescendantStyles = {
//     GSSizes.$sm: radioStyle.variants!.size!.$sm!.descendantStyles!,
//     GSSizes.$md: radioStyle.variants!.size!.$md!.descendantStyles!,
//     GSSizes.$lg: radioStyle.variants!.size!.$lg!.descendantStyles!,
//   };
// }
