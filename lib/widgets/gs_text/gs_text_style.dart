import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/text/text.dart';

final gstextStyle = GSStyle.fromMap(data: textData);

class GSTextStyles {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$2xs: gstextStyle.variants!.size!.$2xs!,
    GSSizes.$xs: gstextStyle.variants!.size!.$xs!,
    GSSizes.$sm: gstextStyle.variants!.size!.$sm!,
    GSSizes.$md: gstextStyle.variants!.size!.$md!,
    GSSizes.$lg: gstextStyle.variants!.size!.$lg!,
    GSSizes.$xl: gstextStyle.variants!.size!.$xl!,
    GSSizes.$2xl: gstextStyle.variants!.size!.$2xl!,
    GSSizes.$3xl: gstextStyle.variants!.size!.$3xl!,
    GSSizes.$4xl: gstextStyle.variants!.size!.$4xl!,
    GSSizes.$5xl: gstextStyle.variants!.size!.$5xl!,
    GSSizes.$6xl: gstextStyle.variants!.size!.$6xl!,
  };
}
