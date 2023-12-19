import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/button/button.dart';

const GSStyleConfig gsButtonConfig = GSStyleConfig(
    componentName: 'Button',
    descendantStyle: ['_text', '_spinner', '_icon'],
    ancestorStyle: ['_button']);

GSStyle buttonStyle = GSStyle.fromMap(
    data: buttonData, descendantStyle: gsButtonConfig.descendantStyle);
