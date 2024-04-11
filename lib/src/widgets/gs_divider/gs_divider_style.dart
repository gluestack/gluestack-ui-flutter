import 'package:gluestack_ui/src/style/gs_style.dart';

final GSStyle dividerStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().divider);

GSStyle baseStyle = GSStyle(
  bg: dividerStyle.bg,
  dark: GSStyle(bg: dividerStyle.bg),
);
