import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioIconConfig =
    GSStyleConfig(componentName: 'RadioIcon', ancestorStyle: ['_icon']);

 GSStyleInt radioIconStyle = 

GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().radioIcon);

 GSStyleInt radioIndicatorStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().radioIndicator);
