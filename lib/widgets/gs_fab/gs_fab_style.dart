import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/style/gs_style_config.dart';
import 'package:gluestack_flutter_pro/theme/config/fab/fab.dart';

GSStyleConfig fabConfig =
    GSStyleConfig(componentName: 'Fab', descendantStyle: ['_text', '_icon']);

GSStyle fabStyle =
    GSStyle.fromMap(data: fabData, descendantStyle: fabConfig.descendantStyle);
