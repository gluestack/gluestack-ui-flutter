import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

GSStyleConfig gsfabIconConfig =
    const GSStyleConfig(componentName: 'FabIcon', ancestorStyle: ['_icon']);

GSStyle fabIconStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().icon)
        .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().fabIcon));


