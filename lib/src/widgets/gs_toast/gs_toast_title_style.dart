import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gstoastTitleConfig = GSStyleConfig(
  componentName: 'ToastTitle',
  ancestorStyle: ['_title'],
);
GSStyleInt toastTitleStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().toastTitle);
