import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/style/gs_style_config.dart';

const GSStyleConfig gsVStackConfig = GSStyleConfig(componentName: 'VStack');

final vstackStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().vstack);
