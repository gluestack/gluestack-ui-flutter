import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gstoastTitleConfig = GSStyleConfig(
  componentName: 'ToastTitle',
  ancestorStyle: ['_title'],
);
GSConfigStyle toastTitleStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().toastTitle);
