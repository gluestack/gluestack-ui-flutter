import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogContentConfig = GSStyleConfig(
  componentName: 'AlertDialogContent',
  ancestorStyle: ['_content'],
);

GSStyle alertDialogContentStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().alertDialogContent);
