import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

GSStyle radioStyle = GSStyle.fromMap(data: radioData);




class GSRadioTextStyle {
  static Map<GSSizes, double?> labelSize = {
    GSSizes.xs: $GSFontSize.$xs,
    GSSizes.sm: $GSFontSize.$sm,
    GSSizes.md: $GSFontSize.$md,
    GSSizes.lg: $GSFontSize.$lg,
    GSSizes.xl: $GSFontSize.$xl,
  };
}
