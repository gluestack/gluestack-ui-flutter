import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/divider/divider.dart';

final GSStyle dividerStyle = GSStyle.fromMap(data: dividerData);

GSStyle baseStyle = GSStyle(
  bg: dividerStyle.bg,
  dark: GSStyle(bg: dividerStyle.bg),
);
