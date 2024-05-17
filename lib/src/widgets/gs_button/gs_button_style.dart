import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsButtonConfig = GSStyleConfig(
    componentName: 'Button',
    descendantStyle: ['_text', '_spinner', '_icon'],
    ancestorStyle: ['_button']);

GSConfigStyle buttonStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().button,
    descendantStyle: gsButtonConfig.descendantStyle);
