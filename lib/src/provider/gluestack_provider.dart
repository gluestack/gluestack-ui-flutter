import 'package:flutter/widgets.dart';
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
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox_icon.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox_indicator.dart';
import 'package:gluestack_ui/src/theme/config/checkbox/checkbox_label.dart';
import 'package:gluestack_ui/src/theme/config/divider/divider.dart';
import 'package:gluestack_ui/src/theme/config/fab/fab.dart';
import 'package:gluestack_ui/src/theme/config/fab/icon.dart';
import 'package:gluestack_ui/src/theme/config/fab/label.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_error_text.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_helper_text.dart';
import 'package:gluestack_ui/src/theme/config/form_control/form_control_label_text.dart';
import 'package:gluestack_ui/src/theme/config/heading/heading.dart';
import 'package:gluestack_ui/src/theme/config/hstack/hstack.dart';
import 'package:gluestack_ui/src/theme/config/icon/icon.dart';
import 'package:gluestack_ui/src/theme/config/image/image.dart';
import 'package:gluestack_ui/src/theme/config/input/input.dart';
import 'package:gluestack_ui/src/theme/config/link/link.dart';
import 'package:gluestack_ui/src/theme/config/link/link_text.dart';
import 'package:gluestack_ui/src/theme/config/pressable/pressable.dart';
import 'package:gluestack_ui/src/theme/config/progress/progress.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio_icon.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio_indicator.dart';
import 'package:gluestack_ui/src/theme/config/radio/radio_label.dart';
import 'package:gluestack_ui/src/theme/config/spinner/spinner.dart';
import 'package:gluestack_ui/src/theme/config/switch/switch.dart';
import 'package:gluestack_ui/src/theme/config/text/text.dart';
import 'package:gluestack_ui/src/theme/config/text_area/text_area.dart';
import 'package:gluestack_ui/src/theme/config/toast/toast.dart';
import 'package:gluestack_ui/src/theme/config/toast/toast_description.dart';
import 'package:gluestack_ui/src/theme/config/toast/toast_title.dart';
import 'package:gluestack_ui/src/theme/config/vstack/vstack.dart';
import 'package:gluestack_ui/src/token/font_weight.dart';
import 'package:gluestack_ui/src/token/line_height.dart';

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

  //icon
  final Map<String, dynamic>? icon;

  //checkbox
  final Map<String, dynamic>? checkboxIcon;
  final Map<String, dynamic>? checkboxIndicator;
  final Map<String, dynamic>? checkboxLabel;
  final Map<String, dynamic>? checkbox;

  //divider
  final Map<String, dynamic>? divider;

//fab
  final Map<String, dynamic>? fabIcon;
  final Map<String, dynamic>? fabLabel;
  final Map<String, dynamic>? fab;

  //formControl
  final Map<String, dynamic>? form;
  final Map<String, dynamic>? formErrorText;
  // final Map<String, dynamic>? formErrorIcon;
  final Map<String, dynamic>? formHelperText;
  final Map<String, dynamic>? formLabel;

  //heading
  final Map<String, dynamic>? heading;

  //hstack
  final Map<String, dynamic>? hstack;

  //image
  final Map<String, dynamic>? image;

  //input
  final Map<String, dynamic>? input;

  //link
  final Map<String, dynamic>? link;
  final Map<String, dynamic>? linkText;

  //pressable
  final Map<String, dynamic>? pressable;

  //progress
  final Map<String, dynamic>? progress;

  //radio
  final Map<String, dynamic>? radioIcon;
  final Map<String, dynamic>? radioIndicator;
  final Map<String, dynamic>? radio;
  final Map<String, dynamic>? radioText;

  //spinner
  final Map<String, dynamic>? spinner;

  //switch
  final Map<String, dynamic>? toggleSwitch;

  //text area data
  final Map<String, dynamic>? textArea;

  //toast
  final Map<String, dynamic>? toastDescriptionText;
  final Map<String, dynamic>? toast;
  final Map<String, dynamic>? toastTitle;

  //vstack
  final Map<String, dynamic>? vstack;

//     getIt<GluestackCustomConfig>().buttonText
  GluestackCustomConfig({
    //vstack
    this.vstack = vStackData,

    //toast
    this.toastDescriptionText = toastDescriptionData,
    this.toast = toastData,
    this.toastTitle = toastTitleData,

    //text area data
    this.textArea = textAreaData,

    //switch
    this.toggleSwitch = switchData,

    //spinner
    this.spinner = spinnerData,

    //radio
    this.radioIcon = radioIconData,
    this.radioIndicator = radioIndicatorData,
    this.radio = radioData,
    this.radioText = radioLabelData,

    //progress
    this.progress = progressData,

    //pressable
    this.pressable = pressableData,

    //link
    this.link = linkData,
    this.linkText = linkTextData,

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

    //icon
    this.icon = iconData,

    //checkbox
    this.checkboxIcon = checkBoxIconData,
    this.checkboxIndicator = checkBoxIndicatorData,
    this.checkboxLabel = checkBoxLabelData,
    this.checkbox = checkBoxData,

//divider
    this.divider = dividerData,

    //fab
    this.fabIcon = fabIconData,
    this.fabLabel = fabLabelData,
    this.fab = fabData,

//form
    this.formErrorText = formControlErrorTextData,
    this.formHelperText = formControlHelperTextData,
    this.formLabel = formControlLabelTextData,
    this.form = formControlData,

    //heading
    this.heading = headingData,

    //hstack
    this.hstack = hstackData,

    //image
    this.image = imageData,

    //input
    this.input = inputData,
//     getIt<GluestackCustomConfig>().buttonText
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
