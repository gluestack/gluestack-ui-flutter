import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkboxIconConfig =
    GSStyleConfig(componentName: 'CheckboxIcon', ancestorStyle: ['_icon']);

GSStyle checkboxIconStyle = GSStyle.fromMap(
        data: getIt<GluestackCustomConfig>().icon)
    .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().checkboxIcon));

