import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';
import 'package:gluestack_ui/src/theme/config/toast/toast_description.dart';

const GSStyleConfig gstoastDescriptionConfig = GSStyleConfig(
  componentName: 'ToastDescription',
  ancestorStyle: ['_description'],
);
GSStyle toastDescriptionStyle = GSStyle.fromMap(data: textData)
    .merge(GSStyle.fromMap(data: toastDescriptionData));

class GSToastDescriptionStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$2xs: toastDescriptionStyle.variants?.size?.$2xs,
    GSSizes.$xs: toastDescriptionStyle.variants?.size?.$xs,
    GSSizes.$sm: toastDescriptionStyle.variants?.size?.$sm,
    GSSizes.$md: toastDescriptionStyle.variants?.size?.$md,
    GSSizes.$lg: toastDescriptionStyle.variants?.size?.$lg,
    GSSizes.$xl: toastDescriptionStyle.variants?.size?.$xl,
  };
}
