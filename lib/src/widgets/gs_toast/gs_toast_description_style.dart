import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gstoastDescriptionConfig = GSStyleConfig(
  componentName: 'ToastDescription',
  ancestorStyle: ['_description'],
);
GSStyle toastDescriptionStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().toastDescriptionText);
