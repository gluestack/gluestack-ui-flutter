import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/theme/config/divider/divider.dart';

final GSStyle dividerStyle = GSStyle.fromMap(data: dividerData);

GSStyle baseStyle = GSStyle(
  bg: dividerStyle.bg,
  dark: GSStyle(bg: dividerStyle.bg),
);
