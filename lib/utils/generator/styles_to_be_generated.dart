import 'package:gluestack_flutter_pro/theme/config/avatar/avatar.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_badge.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_fallback_text.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_group.dart';
import 'package:gluestack_flutter_pro/theme/config/avatar/avatar_image.dart';
import 'package:gluestack_flutter_pro/widgets/gs_avatar/gs_avatar_style.dart';

/// Add style data here and click run in [script.dart]'s [main] func
List<Style> stylesToBeGenerated = [
  //Avatar
  Style(
      generatedStyleName: "avatarStyle",
      styleData: avatarData,
      descendantStyle: gsAvatarConfig.descendantStyle),
  const Style(
      generatedStyleName: "avatarBadgeStyle", styleData: avatarBadgeData),
  const Style(
      generatedStyleName: "avatarFallBackStyle",
      styleData: avatarFallBackTextData),
  const Style(
      generatedStyleName: "avatarGroupStyle", styleData: avatarGroupData),
  const Style(
      generatedStyleName: "avatarImageStyle", styleData: avatarImageData),
];

class Style {
  final String generatedStyleName;
  final Map<String, dynamic> styleData;
  final List<String>? descendantStyle;
  // bool fromVariant;
  const Style({
    required this.generatedStyleName,
    required this.styleData,
    this.descendantStyle = const [],
    // this.fromVariant = false,
  });
}
