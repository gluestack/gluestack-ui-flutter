import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectContentConfig = GSStyleConfig(
  componentName: 'SelectContent',
  descendantStyle: ['_sectionHeaderBackground']
);
final GSConfigStyle selectContentStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().selectContent);