import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioIconConfig =
    GSStyleConfig(componentName: 'RadioIcon', ancestorStyle: ['_icon']);

final GSConfigStyle radioIconStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().icon).merge(
        GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().radioIcon));

final GSConfigStyle radioIndicatorStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().radioIndicator);
