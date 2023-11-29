import 'package:gluestack_flutter_pro/theme/config/avatar/avatar.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_badge.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_fallback_text.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_group.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_image.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button_group.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button_icon.dart';
import 'package:gluestack_flutter_pro/theme/config/text/text.dart';
import 'package:gluestack_flutter_pro/theme/config/button/button_text.dart';

import 'package:gluestack_flutter_pro/widgets/gs_button/gs_button_style.dart';

/// Add style data here and click run in [script.dart]'s [main] func
List<Style> stylesToBeGenerated = [
  //Avatar
  Style(
      generatedStyleName: "buttonStyle",
      styleData: buttonData,
      descendantStyle: gsButtonConfig.descendantStyle),
   Style(
      generatedStyleName: "buttonTextStyle", styleData: buttonTextData, mergeStyleData: textData),
   Style(
      generatedStyleName: "buttonIconStyle", styleData: buttonIconData),
   Style(
      generatedStyleName: "buttonGroupStyle", styleData: buttonGroupData),
];

class Style {
  final String generatedStyleName;
  final Map<String, dynamic> styleData;
  final Map<String, dynamic>? mergeStyleData;
  final List<String>? descendantStyle;
  // bool fromVariant;
  const Style({
    required this.generatedStyleName,
    required this.styleData,
    this.mergeStyleData,
    this.descendantStyle = const [],
    // this.fromVariant = false,
  });
}
