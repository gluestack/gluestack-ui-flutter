import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/heading/heading.dart';

final headingStyle = GSStyle.fromMap(data: headingData);

class GSTextStyles {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: headingStyle.variants!.size!.$xs!,
    GSSizes.$sm: headingStyle.variants!.size!.$sm!,
    GSSizes.$md: headingStyle.variants!.size!.$md!,
    GSSizes.$lg: headingStyle.variants!.size!.$lg!,
    GSSizes.$xl: headingStyle.variants!.size!.$xl!,
    GSSizes.$2xl: headingStyle.variants!.size!.$2xl!,
    GSSizes.$3xl: headingStyle.variants!.size!.$3xl!,
    GSSizes.$4xl: headingStyle.variants!.size!.$4xl!,
    GSSizes.$5xl: headingStyle.variants!.size!.$5xl!,
  };
}
