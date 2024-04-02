import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioTextConfig = GSStyleConfig(
  componentName: 'RadioLabel',
  ancestorStyle: ['_text'],
);

 GSStyle radioLabelStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().text)
        .merge(GSStyle.fromMap(data: getIt<GluestackCustomConfig>().radioText));
