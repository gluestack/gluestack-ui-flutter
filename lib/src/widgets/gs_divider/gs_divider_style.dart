import 'package:gluestack_ui/src/style/gs_config_style_internal.dart';

final GSConfigStyle dividerStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().divider);

GSConfigStyle baseStyle = GSConfigStyle(
  bg: dividerStyle.bg,
  dark: GSConfigStyle(bg: dividerStyle.bg),
);
