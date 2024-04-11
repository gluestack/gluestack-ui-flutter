import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gstoastTitleConfig = GSStyleConfig(
  componentName: 'ToastTitle',
  ancestorStyle: ['_title'],
);
GSStyle toastTitleStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().toastTitle);
