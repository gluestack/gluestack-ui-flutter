import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsToastConfig = GSStyleConfig(
  componentName: 'Toast',
  descendantStyle: ['_icon', '_title', '_description'],
);
GSStyleInt toastStyle = GSStyleInt.fromMap(
    data: getIt<GluestackCustomConfig>().toast,
    descendantStyle: gsToastConfig.descendantStyle);

