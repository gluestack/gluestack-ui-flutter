import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

final iconStyle = GSStyle.fromMap(data: getIt<GluestackCustomConfig>().icon);

const GSStyleConfig gsIconConfig = GSStyleConfig(
  componentName: 'Icon',
  ancestorStyle: ['_icon'],
);