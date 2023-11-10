import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_indicator.dart';
import 'package:gluestack_flutter_pro/theme/config/radio/radio_label.dart';
import 'package:gluestack_flutter_pro/token/index.dart';

final GSStyle radioStyle = GSStyle.fromMap(data: radioData);
final GSStyle radioIconStyle = GSStyle.fromMap(data: radioIconData);
final GSStyle radioIndicatorStyle = GSStyle.fromMap(data: radioIndicatorData);
final GSStyle radioLabelStyle = GSStyle.fromMap(data: radioLabelData);

class GSRadioStyles{
    static Map<GSSizes, Map<String, GSStyle>> radioDescendantStyles = {
    GSSizes.$xs: {
      "_text": GSStyle.fromMap(
          data: radioData['variants']?['size']?['lg']?['_text']),
      "_icon": GSStyle.fromMap(
          data: radioData['variants']?['size']?['lg']?['_icon']),
      "_indicator": GSStyle.fromMap(
          data: radioData['variants']?['size']?['lg']?['_indicator']),
    },
    GSSizes.$sm: {
      "_text": GSStyle.fromMap(
          data: radioData['variants']?['size']?['sm']?['_text']),
      "_icon": GSStyle.fromMap(
          data: radioData['variants']?['size']?['sm']?['_icon']),
      "_indicator": GSStyle.fromMap(
          data: radioData['variants']?['size']?['sm']?['_indicator']),
    },
    GSSizes.$md: {
      "_text": GSStyle.fromMap(
          data: radioData['variants']?['size']?['md']?['_text']),
      "_icon": GSStyle.fromMap(
          data: radioData['variants']?['size']?['md']?['_icon']),
      "_indicator": GSStyle.fromMap(
          data: radioData['variants']?['size']?['md']?['_indicator']),
    },
    GSSizes.$lg: {
      "_text": GSStyle.fromMap(
          data: radioData['variants']?['size']?['lg']?['_text']),
      "_icon": GSStyle.fromMap(
          data: radioData['variants']?['size']?['lg']?['_icon']),
      "_indicator": GSStyle.fromMap(
          data: radioData['variants']?['size']?['lg']?['_indicator']),
    },
    GSSizes.$xl: {
      "_text": GSStyle.fromMap(
          data: radioData['variants']?['size']?['xl']?['_text']),
      "_icon": GSStyle.fromMap(
          data: radioData['variants']?['size']?['xl']?['_icon']),
      "_indicator": GSStyle.fromMap(
          data: radioData['variants']?['size']?['xl']?['_indicator']),
    },
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


class GSRadioIconStyle{
    static Map<GSSizes, double?> iconSize = {
    GSSizes.$xs: $GSFontSize.$xs,
    GSSizes.$sm: $GSFontSize.$sm,
    GSSizes.$md: $GSFontSize.$md,
    GSSizes.$lg: $GSFontSize.$lg,
    GSSizes.$xl: $GSFontSize.$xl,
  };
}