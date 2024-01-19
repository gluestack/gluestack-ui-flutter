import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsButtonConfig = GSStyleConfig(
    componentName: 'Button',
    descendantStyle: ['_text', '_spinner', '_icon'],
    ancestorStyle: ['_button']);

GSStyle buttonStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().button,
    descendantStyle: gsButtonConfig.descendantStyle);
