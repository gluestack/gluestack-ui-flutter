import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsSelectSelectionHeaderTextConfig = GSStyleConfig(
  componentName: 'SelectSelectionHeaderText',
);
final GSConfigStyle selectSelectionHeaderTextStyle = GSConfigStyle.fromMap(
    data: getIt<GluestackCustomConfig>().selectSelectionHeaderText);
