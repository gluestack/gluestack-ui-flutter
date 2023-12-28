import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gluestack_ui/gluestack_ui.dart';
import 'package:gluestack_ui/src/theme/config/alert/alert_dialog.dart';
import 'package:gluestack_ui/src/theme/config/alert/alert_dialog_body.dart';
import 'package:gluestack_ui/src/theme/config/alert/alert_dialog_content.dart';
import 'package:gluestack_ui/src/theme/config/alert/alert_dialog_footer.dart';
import 'package:gluestack_ui/src/theme/config/alert/alert_dialog_header.dart';
import 'package:gluestack_ui/src/theme/config/avatar/avatar.dart';
import 'package:gluestack_ui/src/theme/config/avatar/avatar_badge.dart';
import 'package:gluestack_ui/src/theme/config/avatar/avatar_fallback_text.dart';
import 'package:gluestack_ui/src/theme/config/avatar/avatar_group.dart';
import 'package:gluestack_ui/src/theme/config/badge/badge.dart';
import 'package:gluestack_ui/src/theme/config/badge/badge_icon.dart';
import 'package:gluestack_ui/src/theme/config/badge/badge_text.dart';
import 'package:gluestack_ui/src/theme/config/button/button.dart';
import 'package:gluestack_ui/src/theme/config/button/button_group.dart';
import 'package:gluestack_ui/src/theme/config/button/button_icon.dart';
import 'package:gluestack_ui/src/theme/config/button/button_text.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';
import 'package:gluestack_ui/src/token/font_weight.dart';
import 'package:gluestack_ui/src/token/line_height.dart';
import 'package:gluestack_ui/src/token/screen_breakpoint.dart';

final getIt = GetIt.instance;

class GluestackProvider extends StatelessWidget {
  final Widget child;
  GluestackTokenConfig? gluestackTokenConfig;
  GluestackCustomConfig? gluestackCustomConfig;
  GluestackProvider(
      {super.key,
      required this.child,
      this.gluestackTokenConfig,
      this.gluestackCustomConfig}) {
    gluestackTokenConfig ??= GluestackTokenConfig();
    gluestackCustomConfig ??= GluestackCustomConfig();

    if (!getIt.isRegistered<GluestackCustomConfig>()) {
      getIt.registerSingleton<GluestackCustomConfig>(gluestackCustomConfig!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class GluestackCustomConfig {
  //button
  final Map<String, dynamic>? button;
  final Map<String, dynamic>? buttonText;
  // final Map<String, dynamic>? buttonSpinner;
  final Map<String, dynamic>? buttonIcon;
  final Map<String, dynamic>? buttonGroup;

  //text
  final Map<String, dynamic>? text;

  //alert
  final Map<String, dynamic>? alertDialogBody;
  final Map<String, dynamic>? alertDialogContent;
  final Map<String, dynamic>? alertDialogFooter;
  final Map<String, dynamic>? alertDialogHeader;
  final Map<String, dynamic>? alertDialog;

  //avatar
  final Map<String, dynamic>? avatarBadge;
  final Map<String, dynamic>? avatarFallbackText;
  final Map<String, dynamic>? avatarGroup;
  final Map<String, dynamic>? avatar;

  //badge
  final Map<String, dynamic>? badge;
  final Map<String, dynamic>? badgeText;
  final Map<String, dynamic>? badgeIcon;

//     getIt<GluestackCustomConfig>().buttonText
  GluestackCustomConfig({
    //badge
    this.badge = badgeData,
    this.badgeText = badgeTextData,
    this.badgeIcon = badgeIconData,

    //text
    this.text = textData,

    //avatar
    this.avatarBadge = avatarBadgeData,
    this.avatarFallbackText = avatarFallBackTextData,
    this.avatarGroup = avatarGroupData,
    this.avatar = avatarData,

    //alert
    this.alertDialog = alertDialogData,
    this.alertDialogBody = alertDialogBodyData,
    this.alertDialogContent = alertDialogContentData,
    this.alertDialogFooter = alertDialogFooterData,
    this.alertDialogHeader = alertDialogHeaderData,

    //button
    this.button = buttonData,
    this.buttonText = buttonTextData,
    this.buttonIcon = buttonIconData,
    this.buttonGroup = buttonGroupData,
  });
}

class GluestackTokenConfig {
  final GSBorderWidthToken gsBorderWidthToken;
  final GSFontSizeToken gsFontSizeToken;
  final GSFontWeightsToken gsFontWeightsToken;
  final GSLetterSpacingToken gsLetterSpacingToken;
  final GSLineHeightToken gsLineHeightToken;
  final GSRadiiToken gsRadiiToken;
  final GSSpaceToken gsSpaceToken;
  final GSColorsToken gsColorsToken;
  final GSScreenBreakpointToken gsScreenBreakpointToken;

  GluestackTokenConfig({
    this.gsBorderWidthToken = const GSBorderWidthToken(),
    this.gsFontSizeToken = const GSFontSizeToken(),
    this.gsFontWeightsToken = const GSFontWeightsToken(),
    this.gsLetterSpacingToken = const GSLetterSpacingToken(),
    this.gsLineHeightToken = const GSLineHeightToken(),
    this.gsRadiiToken = const GSRadiiToken(),
    this.gsSpaceToken = const GSSpaceToken(),
    this.gsColorsToken = const GSColorsToken(),
    this.gsScreenBreakpointToken = const GSScreenBreakpointToken(),
  }) {
    if (!getIt.isRegistered<GSBorderWidthToken>()) {
      getIt.registerSingleton<GSBorderWidthToken>(gsBorderWidthToken);
    }
    if (!getIt.isRegistered<GSFontSizeToken>()) {
      getIt.registerSingleton<GSFontSizeToken>(gsFontSizeToken);
    }
    if (!getIt.isRegistered<GSFontWeightsToken>()) {
      getIt.registerSingleton<GSFontWeightsToken>(gsFontWeightsToken);
    }
    if (!getIt.isRegistered<GSLetterSpacingToken>()) {
      getIt.registerSingleton<GSLetterSpacingToken>(gsLetterSpacingToken);
    }
    if (!getIt.isRegistered<GSLineHeightToken>()) {
      getIt.registerSingleton<GSLineHeightToken>(gsLineHeightToken);
    }
    if (!getIt.isRegistered<GSRadiiToken>()) {
      getIt.registerSingleton<GSRadiiToken>(gsRadiiToken);
    }
    if (!getIt.isRegistered<GSSpaceToken>()) {
      getIt.registerSingleton<GSSpaceToken>(gsSpaceToken);
    }
    if (!getIt.isRegistered<GSColorsToken>()) {
      getIt.registerSingleton<GSColorsToken>(gsColorsToken);
    }
    if (!getIt.isRegistered<GSScreenBreakpointToken>()) {
      getIt.registerSingleton<GSScreenBreakpointToken>(gsScreenBreakpointToken);
    }
  }
}
