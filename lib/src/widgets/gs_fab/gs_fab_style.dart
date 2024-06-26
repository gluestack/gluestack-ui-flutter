import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyleConfig fabConfig = const GSStyleConfig(
    componentName: 'Fab', descendantStyle: ['_text', '_icon']);

GSConfigStyle fabStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().fab,
    descendantStyle: fabConfig.descendantStyle);
