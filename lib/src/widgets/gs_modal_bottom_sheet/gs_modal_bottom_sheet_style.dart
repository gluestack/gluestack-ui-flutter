import 'package:gluestack_ui/src/provider/gluestack_provider.dart';
import 'package:gluestack_ui/src/style/gs_style.dart';

final GSStyle gsModalBottomSheetStyle =
    GSStyle.fromMap(data: getIt<GluestackCustomConfig>().modalBottomSheet);

class GSModalBottomSheetStyle {
  static Map<GSBorderRadius, double> borderRadius = {
    GSBorderRadius.$none: 0,
    GSBorderRadius.$xs: 4,
    GSBorderRadius.$sm: 6,
    GSBorderRadius.$md: 8,
    GSBorderRadius.$lg: 10,
    GSBorderRadius.$xl: 12,
    GSBorderRadius.$2xl: 16,
    GSBorderRadius.$3xl: 24,
    GSBorderRadius.$full: 999,
  };
}
