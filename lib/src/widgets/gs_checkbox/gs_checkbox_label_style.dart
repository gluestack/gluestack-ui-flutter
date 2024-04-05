import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig checkBoxLabelConfig = GSStyleConfig(
  componentName: 'CheckboxLabel',
  ancestorStyle: ['_text'],
);

GSStyle checkBoxLabelStyle = GSStyle.fromMap(
        data: getIt<GluestackCustomConfig>().text)
    .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().checkboxLabel));


