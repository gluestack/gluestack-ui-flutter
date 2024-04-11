import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogConfig = GSStyleConfig(
  componentName: 'AlertDialog',
  descendantStyle: ['_content'],
);

GSStyle alertDialogStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().alertDialog,
    descendantStyle: gsAlertDialogConfig.descendantStyle);
