import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyle iconButtonStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().iconButton,
    descendantStyle: gsIconButtonConfig.descendantStyle);

const GSStyleConfig gsIconButtonConfig = GSStyleConfig(
  componentName: 'IconButton',
  descendantStyle: ['_icon'],
);
