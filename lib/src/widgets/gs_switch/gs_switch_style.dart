import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';

GSConfigStyle switchStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().toggleSwitch);
