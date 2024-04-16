import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsRadioTextConfig = GSStyleConfig(
  componentName: 'RadioLabel',
  ancestorStyle: ['_text'],
);

GSStyleInt radioLabelStyle = 
GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().radioText);
