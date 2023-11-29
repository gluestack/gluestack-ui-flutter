
import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/theme/config/switch/switch.dart';

GSStyle switchStyle = GSStyle.fromMap(data: switchData);

class GSSwitchStyle {
  static Map<GSSizes, GSStyle?> size = {
    GSSizes.$sm: switchStyle.variants?.size?.$sm,
    GSSizes.$md: switchStyle.variants?.size?.$md,
    GSSizes.$lg: switchStyle.variants?.size?.$lg,
  };
}