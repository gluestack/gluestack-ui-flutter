import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_indicator.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_label.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

final GSStyle radioStyle =
    GSStyle.fromMap(data: radioData, descendantStyle: descendant);
final GSStyle radioIconStyle = GSStyle.fromMap(data: radioIconData);
final GSStyle radioIndicatorStyle = GSStyle.fromMap(data: radioIndicatorData);
final GSStyle radioLabelStyle = GSStyle.fromMap(data: radioLabelData);

List<String> descendant = ['_text', '_icon', '_indicator'];

class GSRadioStyles {
  static Map<GSSizes, Map<String, GSStyle?>> radioDescendantStyles = {
    GSSizes.$sm: radioStyle.variants!.size!.$sm!.descendantStyles!,
    GSSizes.$md: radioStyle.variants!.size!.$md!.descendantStyles!,
    GSSizes.$lg: radioStyle.variants!.size!.$lg!.descendantStyles!,
  };
}

class GSRadioTextStyle {
  static Map<GSSizes, double?> labelSize = {
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl,
  };
}

class GSRadioIconStyle {
  static Map<GSSizes, double?> iconSize = {
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl,
  };
}
