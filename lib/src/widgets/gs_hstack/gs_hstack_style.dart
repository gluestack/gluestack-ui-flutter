import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsHStackConfig = GSStyleConfig(componentName: 'HStack');

final hstackStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().hstack);
