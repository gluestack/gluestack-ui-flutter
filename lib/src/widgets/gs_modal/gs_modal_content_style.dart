import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsModalContentConfig = GSStyleConfig(
  componentName: 'Modal',
  ancestorStyle: ['_content'],
);

final GSConfigStyle gsModalContentStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().modalContent);
