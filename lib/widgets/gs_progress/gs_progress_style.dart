import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/progress/progress.dart';

GSStyle progressStyle = GSStyle.fromMap(data: progressData);

class GSProgressStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$xs: progressStyle.variants!.size!.$xs!,
    GSSizes.$sm: progressStyle.variants!.size!.$sm!,
    GSSizes.$md: progressStyle.variants!.size!.$md!,
    GSSizes.$lg: progressStyle.variants!.size!.$lg!,
    GSSizes.$xl: progressStyle.variants!.size!.$xl!,
    GSSizes.$2xl: progressStyle.variants!.size!.$2xl!,
  };
}