import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsAlertDialogContentConfig = GSStyleConfig(
  componentName: 'AlertDialogContent',
  ancestorStyle: ['_content'],
);

GSStyleInt alertDialogContentStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().alertDialogContent);
