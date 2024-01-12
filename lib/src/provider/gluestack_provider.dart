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
  Map<String, dynamic>? button;
  Map<String, dynamic>? buttonText;
  // final Map<String, dynamic>? buttonSpinner;
  Map<String, dynamic>? buttonIcon;
  Map<String, dynamic>? buttonGroup;

  //text
  Map<String, dynamic>? text;

  //alert
  Map<String, dynamic>? alertDialogBody;
  Map<String, dynamic>? alertDialogContent;
  Map<String, dynamic>? alertDialogFooter;
  Map<String, dynamic>? alertDialogHeader;
  Map<String, dynamic>? alertDialog;

  //avatar
  Map<String, dynamic>? avatarBadge;
  Map<String, dynamic>? avatarFallbackText;
  Map<String, dynamic>? avatarGroup;
  Map<String, dynamic>? avatar;

  //badge
  Map<String, dynamic>? badge;
  Map<String, dynamic>? badgeText;
  Map<String, dynamic>? badgeIcon;

  //icon
  Map<String, dynamic>? icon;

  //checkbox
  Map<String, dynamic>? checkboxIcon;
  Map<String, dynamic>? checkboxIndicator;
  Map<String, dynamic>? checkboxLabel;
  Map<String, dynamic>? checkbox;

  //divider
  Map<String, dynamic>? divider;

  //fab
  Map<String, dynamic>? fabIcon;
  Map<String, dynamic>? fabLabel;
  Map<String, dynamic>? fab;
  //formControl
  Map<String, dynamic>? form;
  Map<String, dynamic>? formErrorText;
  // final Map<String, dynamic>? formErrorIcon;
  Map<String, dynamic>? formHelperText;
  Map<String, dynamic>? formLabel;
  //heading
  Map<String, dynamic>? heading;
  //hstack
  Map<String, dynamic>? hstack;
  //image
  Map<String, dynamic>? image;
  //input
  Map<String, dynamic>? input;
  //link
  Map<String, dynamic>? link;
  Map<String, dynamic>? linkText;
  //pressable
  Map<String, dynamic>? pressable;
  //progress
  Map<String, dynamic>? progress;
  //radio
  Map<String, dynamic>? radioIcon;
  Map<String, dynamic>? radioIndicator;
  Map<String, dynamic>? radio;
  Map<String, dynamic>? radioText;
  //spinner
  Map<String, dynamic>? spinner;
  //switch
  Map<String, dynamic>? toggleSwitch;
  //text area data
  Map<String, dynamic>? textArea;
  //toast
  Map<String, dynamic>? toastDescriptionText;
  Map<String, dynamic>? toast;
  Map<String, dynamic>? toastTitle;
  //vstack
  Map<String, dynamic>? vstack;
//getIt<GluestackCustomConfig>().buttonText
  GluestackCustomConfig({
    //vstack
    this.vstack,

    //toast
    this.toastDescriptionText,
    this.toast,
    this.toastTitle,

    //text area data
    this.textArea,

    //switch
    this.toggleSwitch,

    //spinner
    this.spinner,

    //radio
    this.radioIcon,
    this.radioIndicator,
    this.radio,
    this.radioText,

    //progress
    this.progress,

    //pressable
    this.pressable,

    //link
    this.link,
    this.linkText,

    //badge
    this.badge,
    this.badgeText,
    this.badgeIcon,

    //text
    this.text,

    //avatar
    this.avatarBadge,
    this.avatarFallbackText,
    this.avatarGroup,
    this.avatar,

    //alert
    this.alertDialog,
    this.alertDialogBody,
    this.alertDialogContent,
    this.alertDialogFooter,
    this.alertDialogHeader,

    //button
    this.button,
    this.buttonText,
    this.buttonIcon,
    this.buttonGroup,

    //icon
    this.icon,

    //checkbox
    this.checkboxIcon,
    this.checkboxIndicator,
    this.checkboxLabel,
    this.checkbox,

//divider
    this.divider,

    //fab
    this.fabIcon,
    this.fabLabel,
    this.fab,

//form
    this.formErrorText,
    this.formHelperText,
    this.formLabel,
    this.form,

    //heading
    this.heading,

    //hstack
    this.hstack,

    //image
    this.image,

    //input
    this.input,
//     getIt<GluestackCustomConfig>().buttonText
  }) {
    Map<String, dynamic> mergeConfigs(
        Map<String, dynamic> map1, Map<String, dynamic>? map2) {
      Map<String, dynamic> mergedMap = {...map1};
      if (map2 != null) {
        map2.forEach((key, value) {
          if (mergedMap.containsKey(key) &&
              mergedMap[key] is Map &&
              value is Map) {
            // Recursively merge nested maps
            mergedMap[key] =
                mergeConfigs(mergedMap[key], value as Map<String, dynamic>);
          } else {
            // Overwrite or add values
            mergedMap[key] = value;
          }
        });
      }

      return mergedMap;
    }

    //vstack
    vstack = mergeConfigs(vStackData, vstack);

    //toast
    toastDescriptionText =
        mergeConfigs(toastDescriptionData, toastDescriptionText);
    toast = mergeConfigs(toastData, toast);
    toastTitle = mergeConfigs(toastTitleData, toastTitle);

    //text area data
    textArea = mergeConfigs(textAreaData, textArea);

    //switch
    toggleSwitch = mergeConfigs(switchData, toggleSwitch);

    //spinner
    spinner = mergeConfigs(spinnerData, spinner);

    //radio
    radioIcon = mergeConfigs(radioIconData, radioIcon);
    radioIndicator = mergeConfigs(radioIndicatorData, radioIndicator);
    radio = mergeConfigs(radioData, radio);
    radioText = mergeConfigs(radioLabelData, radioText);

    //progress
    progress = mergeConfigs(progressData, progress);

    //pressable
    pressable = mergeConfigs(pressableData, pressable);

    //link
    link = mergeConfigs(linkData, link);
    linkText = mergeConfigs(linkTextData, linkText);

    //badge
    badge = mergeConfigs(badgeData, badge);
    badgeText = mergeConfigs(badgeTextData, badgeText);
    badgeIcon = mergeConfigs(badgeIconData, badgeIcon);

    //text
    text = mergeConfigs(textData, text);

    //avatar
    avatarBadge = mergeConfigs(avatarBadgeData, avatarBadge);
    avatarFallbackText =
        mergeConfigs(avatarFallBackTextData, avatarFallbackText);
    avatarGroup = mergeConfigs(avatarGroupData, avatarGroup);
    avatar = mergeConfigs(avatarData, avatar);

    //alert
    alertDialog = mergeConfigs(alertDialogData, alertDialog);
    alertDialogBody = mergeConfigs(alertDialogBodyData, alertDialogBody);
    alertDialogContent =
        mergeConfigs(alertDialogContentData, alertDialogContent);
    alertDialogFooter = mergeConfigs(alertDialogFooterData, alertDialogFooter);
    alertDialogHeader = mergeConfigs(alertDialogHeaderData, alertDialogHeader);

    //button
    button = mergeConfigs(buttonData, button);
    // print(button);
    buttonText = mergeConfigs(buttonTextData, buttonText);
    buttonIcon = mergeConfigs(buttonIconData, buttonIcon);
    buttonGroup = mergeConfigs(buttonGroupData, buttonGroup);

    //icon
    icon = mergeConfigs(iconData, icon);

    //checkbox
    checkboxIcon = mergeConfigs(checkBoxIconData, checkboxIcon);
    checkboxIndicator = mergeConfigs(checkBoxIndicatorData, checkboxIndicator);
    checkboxLabel = mergeConfigs(checkBoxLabelData, checkboxLabel);
    checkbox = mergeConfigs(checkBoxData, checkbox);

    //divider
    divider = mergeConfigs(dividerData, divider);

    //fab
    fabIcon = mergeConfigs(fabIconData, fabIcon);
    fabLabel = mergeConfigs(fabLabelData, fabLabel);
    fab = mergeConfigs(fabData, fab);

    //form
    formErrorText = mergeConfigs(formControlErrorTextData, formErrorText);
    formHelperText = mergeConfigs(formControlHelperTextData, formHelperText);
    formLabel = mergeConfigs(formControlLabelTextData, formLabel);
    form = mergeConfigs(formControlData, form);

    //heading
    heading = mergeConfigs(headingData, heading);

    //hstack
    hstack = mergeConfigs(hstackData, hstack);

    //image
    image = mergeConfigs(imageData, image);

    //input
    input = mergeConfigs(inputData, input);
  }
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
