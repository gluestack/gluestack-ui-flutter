import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogConfig = GSStyleConfig(
  componentName: 'AlertDialog',
  descendantStyle: ['_content'],
);

GSConfigStyle alertDialogStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().alertDialog,
    descendantStyle: gsAlertDialogConfig.descendantStyle);
