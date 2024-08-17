import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectSelectedInputConfig = GSStyleConfig(
  componentName: 'SelectSelectedInput',
   ancestorStyle: ['_input']
);
final GSConfigStyle selectSelectedInputStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().selectSelectedInput);