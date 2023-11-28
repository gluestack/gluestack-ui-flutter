
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button.dart';


GSStyleConfig gsButtonConfig = GSStyleConfig(
    componentName: 'Button',
    descendantStyle: ['_text', '_spinner', '_icon'],
    ancestorStyle: ['_button']);

GSStyle buttonStyle = GSStyle.fromMap(
    data: buttonData, descendantStyle: gsButtonConfig.descendantStyle);
 



class GSButtonStyle {


  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: buttonStyle.variants!.size!.$xs!,
    GSSizes.$sm: buttonStyle.variants!.size!.$sm!,
    GSSizes.$md: buttonStyle.variants!.size!.$md!,
    GSSizes.$lg: buttonStyle.variants!.size!.$lg!,
  };


}
