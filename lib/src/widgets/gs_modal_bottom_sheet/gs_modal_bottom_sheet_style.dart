import 'package:gluestack_ui/gluestack_ui.dart';

final GSStyle gsModalBottomSheetStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().modalBottomSheet);

class GSModalBottomSheetStyle {
  static Map<GSBorderRadius, double> borderRadius = {
    GSBorderRadius.$none: $GSRadii.none,
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
