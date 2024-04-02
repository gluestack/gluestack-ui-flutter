import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioIconConfig =
    GSStyleConfig(componentName: 'RadioIcon', ancestorStyle: ['_icon']);

GSStyle radioIconStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().icon)
        .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().radioIcon));

GSStyle radioIndicatorStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().radioIndicator);
