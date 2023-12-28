import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogConfig = GSStyleConfig(
  componentName: 'AlertDialog',
  descendantStyle: ['_content'],
);

GSStyle alertDialogStyle = GSStyle.fromMap(
    data: getIt<GluestackCustomConfig>().alertDialog,
    descendantStyle: gsAlertDialogConfig.descendantStyle);

class GSAlertDialogStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: alertDialogStyle.variants!.size!.$xs!,
    GSSizes.$sm: alertDialogStyle.variants!.size!.$sm!,
    GSSizes.$md: alertDialogStyle.variants!.size!.$md!,
    GSSizes.$lg: alertDialogStyle.variants!.size!.$lg!,
    GSSizes.$full: alertDialogStyle.variants!.size!.$full!,
  };
}
