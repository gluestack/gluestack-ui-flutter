import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/alert/alert_dialog.dart';

GSStyle alertDialogStyle = GSStyle.fromMap(data: alertDialogData);

class GSAlertDialogStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: alertDialogStyle.variants!.size!.$xs!,
    GSSizes.$sm: alertDialogStyle.variants!.size!.$sm!,
    GSSizes.$md: alertDialogStyle.variants!.size!.$md!,
    GSSizes.$lg: alertDialogStyle.variants!.size!.$lg!,
    GSSizes.$full: alertDialogStyle.variants!.size!.$full!,
  };
}
