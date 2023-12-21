import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/alert/alert_dialog.dart';

const GSStyleConfig gsAlertDialogConfig = GSStyleConfig(
  componentName: 'AlertDialog',
  descendantStyle: ['_content'],
);

GSStyle alertDialogStyle = GSStyle.fromMap(
    data: alertDialogData,
    descendantStyle: gsAlertDialogConfig.descendantStyle);
