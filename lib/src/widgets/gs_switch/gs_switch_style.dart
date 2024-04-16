import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

GSStyleInt switchStyle =
    GSStyleInt.fromMap(data: getIt<GluestackCustomConfig>().toggleSwitch);
