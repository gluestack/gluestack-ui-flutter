import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsTextConfig =
    GSStyleConfig(componentName: 'ButtonText', ancestorStyle: ['_text']);

GSStyleInt buttonTextStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().buttonText);
