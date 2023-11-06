import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/image/image.dart';

final imageStyle = GSStyle.fromMap(data: imageData);


class GSImageStyle{
    static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: imageStyle.variants!.size!.$sm!,
    GSSizes.$md: imageStyle.variants!.size!.$md!,
    GSSizes.$lg: imageStyle.variants!.size!.$lg!,
    GSSizes.$xl: imageStyle.variants!.size!.$xl!,
    GSSizes.$2xl:imageStyle.variants!.size!.$2xl!,
    GSSizes.$2xs:imageStyle.variants!.size!.$2xs!
  };
}