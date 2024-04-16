import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogConfig = GSStyleConfig(
  componentName: 'AlertDialog',
  descendantStyle: ['_content'],
);

GSStyleInt alertDialogStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().alertDialog,
    descendantStyle: gsAlertDialogConfig.descendantStyle);
