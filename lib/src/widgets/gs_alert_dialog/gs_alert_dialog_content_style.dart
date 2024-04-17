import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogContentConfig = GSStyleConfig(
  componentName: 'AlertDialogContent',
  ancestorStyle: ['_content'],
);

GSConfigStyle alertDialogContentStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().alertDialogContent);
