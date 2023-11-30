import 'package:gluestack_ui/src/style/gs_style.dart';
import 'package:gluestack_ui/src/theme/config/image/image.dart';
import 'package:gluestack_ui/src/token/radii_token.dart';

final imageStyle = GSStyle.fromMap(data: imageData);

class GSImageStyle {
  static Map<GSSizes, GSStyle> size = {
    GSSizes.$sm: imageStyle.variants!.size!.$sm!,
    GSSizes.$md: imageStyle.variants!.size!.$md!,
    GSSizes.$lg: imageStyle.variants!.size!.$lg!,
    GSSizes.$xl: imageStyle.variants!.size!.$xl!,
    GSSizes.$2xl: imageStyle.variants!.size!.$2xl!,
    GSSizes.$2xs: imageStyle.variants!.size!.$2xs!
  };

  static Map<GSBorderRadius, double> radius = {
    GSBorderRadius.$sm: $GSRadii.$sm,
    GSBorderRadius.$md: $GSRadii.$md,
    GSBorderRadius.$lg: $GSRadii.$lg,
    GSBorderRadius.$xl: $GSRadii.$xl,
    GSBorderRadius.$2xl:$GSRadii.$2xl,
    GSBorderRadius.$xs:$GSRadii.$xs,
    GSBorderRadius.$3xl:$GSRadii.$3xl,
    GSBorderRadius.$full:$GSRadii.full,
  };
}
