import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';
import 'package:gluestack_ui/src/theme/config/toast/toast_title.dart';

GSStyleConfig gstoastTitleConfig = GSStyleConfig(
  componentName: 'ToastTitle',
  ancestorStyle: ['_title'],
);
GSStyle toastTitleStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: toastTitleData));

class GSToastTitleStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$2xs: toastTitleStyle.variants?.size?.$2xs,
    GSSizes.$xs: toastTitleStyle.variants?.size?.$xs,
    GSSizes.$sm: toastTitleStyle.variants?.size?.$sm,
    GSSizes.$md: toastTitleStyle.variants?.size?.$md,
    GSSizes.$lg: toastTitleStyle.variants?.size?.$lg,
    GSSizes.$xl: toastTitleStyle.variants?.size?.$xl,
  };
}
