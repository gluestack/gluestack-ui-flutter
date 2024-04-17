import 'package:gluestack_ui/src/style/gs_style.dart';

final imageStyle =
    GSConfigStyle.fromMap(data: getIt<GluestackCustomConfig>().image);

class GSImageStyle {
  static Map<GSBorderRadius, double> radius = {
    GSBorderRadius.$sm: $GSRadii.$sm,
    GSBorderRadius.$md: $GSRadii.$md,
    GSBorderRadius.$lg: $GSRadii.$lg,
    GSBorderRadius.$xl: $GSRadii.$xl,
    GSBorderRadius.$2xl: $GSRadii.$2xl,
    GSBorderRadius.$xs: $GSRadii.$xs,
    GSBorderRadius.$3xl: $GSRadii.$3xl,
    GSBorderRadius.$full: $GSRadii.full,
  };
}
