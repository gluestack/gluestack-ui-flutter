import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/theme/config/icon/icon.dart';

final iconStyle = GSStyle.fromMap(data: iconData);

class GSIconStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: iconStyle.variants!.size!.$xs!,
    GSSizes.$sm: iconStyle.variants!.size!.$sm!,
    GSSizes.$md: iconStyle.variants!.size!.$md!,
    GSSizes.$lg: iconStyle.variants!.size!.$lg!,
    GSSizes.$xl: iconStyle.variants!.size!.$xl!,
  };
}
