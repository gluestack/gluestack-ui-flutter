import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/text/text.dart';

final gstextStyle = GSStyle.fromMap(data: textData);

class GSTextStyles {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.xs: gstextStyle.variants!.size!.xs!,
    GSSizes.sm: gstextStyle.variants!.size!.sm!,
    GSSizes.md: gstextStyle.variants!.size!.md!,
    GSSizes.lg: gstextStyle.variants!.size!.lg!,
    GSSizes.xl: gstextStyle.variants!.size!.xl!,
    GSSizes.xxl: gstextStyle.variants!.size!.xxl!,
    GSSizes.xxxl: gstextStyle.variants!.size!.xxxl!,
    GSSizes.xxxxl: gstextStyle.variants!.size!.xxxxl!,
    GSSizes.xxs: gstextStyle.variants!.size!.xxs!,
    GSSizes.xxxxxl: gstextStyle.variants!.size!.xxxxxl!,
    GSSizes.xxxxxxxl: gstextStyle.variants!.size!.xxxxxxl!,
  };
}
