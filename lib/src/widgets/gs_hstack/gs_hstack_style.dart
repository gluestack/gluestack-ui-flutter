import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsHStackConfig = GSStyleConfig(componentName: 'HStack');

final hstackStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().hstack);
