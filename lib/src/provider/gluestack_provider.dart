import 'provider.dart';

final getIt = GetIt.instance;

class GluestackProvider extends StatelessWidget {
  final Widget child;
  final GluestackTokenConfig gluestackTokenConfig;
  final GluestackCustomConfig gluestackCustomConfig;
  GluestackProvider({
    super.key,
    required this.child,
    GluestackTokenConfig? gluestackTokenConfig,
    GluestackCustomConfig? gluestackCustomConfig,
  })  : gluestackTokenConfig = gluestackTokenConfig ?? GluestackTokenConfig(),
        gluestackCustomConfig =
            gluestackCustomConfig ?? GluestackCustomConfig() {
    if (!getIt.isRegistered<GluestackCustomConfig>()) {
      getIt
          .registerSingleton<GluestackCustomConfig>(this.gluestackCustomConfig);
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
  Map<String, dynamic>? progressFilledTrack;
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

//accordion
  Map<String, dynamic>? accordion;
  Map<String, dynamic>? accordionHeader;
  Map<String, dynamic>? accordionContent;
  Map<String, dynamic>? accordionTitleText;
  Map<String, dynamic>? accordionContentText;
  Map<String, dynamic>? accordionTrigger;
  Map<String, dynamic>? accordionIcon;
  Map<String, dynamic>? accordionItem;

  Map<String, dynamic>? modalBottomSheet;
  Map<String, dynamic>? navigationRail;
  Map<String, dynamic>? navigationRailSelectedLableText;
  Map<String, dynamic>? navigationRailUnselectedLableText;
// stepper
  Map<String, dynamic>? stepper;
  Map<String, dynamic>? stepperTitleText;
  Map<String, dynamic>? stepperSubtitleText;
  Map<String, dynamic>? stepperContentText;
  //tabs
  Map<String, dynamic>? tabs;
  Map<String, dynamic>? tabsTab;
  Map<String, dynamic>? tabTabIcon;
  Map<String, dynamic>? tabTabList;
  Map<String, dynamic>? tabTabPanel;
  Map<String, dynamic>? tabTabPanels;
  Map<String, dynamic>? tabTabTile;

  //GS Layout
  Map<String, dynamic>? layout;

  GluestackCustomConfig({
    //tabs
    this.tabs,
    this.tabsTab,
    this.tabTabIcon,
    this.tabTabList,
    this.tabTabPanel,
    this.tabTabPanels,
    this.tabTabTile,

    //GS Layout
    this.layout,

    //accordion
    this.accordion,
    this.accordionHeader,
    this.accordionTitleText,
    this.accordionContent,
    this.accordionContentText,
    this.accordionTrigger,
    this.accordionIcon,
    this.accordionItem,

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
    this.progressFilledTrack,

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
    this.modalBottomSheet,
    this.navigationRail,
    this.navigationRailSelectedLableText,
    this.navigationRailUnselectedLableText,

    //stepper
    this.stepper,
    this.stepperTitleText,
    this.stepperSubtitleText,
    this.stepperContentText,
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

//layout
    layout = mergeConfigs(layoutData, layout);

    //tabs
    tabs = mergeConfigs(tabsData, tabs);
    tabsTab = mergeConfigs(tabsTabData, tabsTab);
    tabTabIcon = mergeConfigs(tabsTabIconData, tabTabIcon);
    tabTabList = mergeConfigs(tabsTabListData, tabTabList);
    tabTabPanel = mergeConfigs(tabsTabPanelData, tabTabPanel);
    tabTabPanels = mergeConfigs(tabsTabPanelsData, tabTabPanels);
    tabTabTile = mergeConfigs(tabsTitleData, tabTabTile);

    //accordion
    accordion = mergeConfigs(accordionData, accordion);
    accordionHeader = mergeConfigs(accordionHeaderData, accordionHeader);
    accordionTitleText =
        mergeConfigs(accordionTitleTextData, accordionTitleText);
    accordionContent = mergeConfigs(accordionContentData, accordionContent);
    accordionContentText =
        mergeConfigs(accordionContentTextData, accordionContentText);
    accordionTrigger = mergeConfigs(accordionTriggerData, accordionTrigger);
    accordionIcon = mergeConfigs(accordionIconData, accordionIcon);
    accordionItem = mergeConfigs(accordionItemData, accordionItem);

    //vstack
    vstack = mergeConfigs(vstackData, vstack);

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
    progressFilledTrack =
        mergeConfigs(progressFilledTrackData, progressFilledTrack);

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

    //modalbottomsheet

    modalBottomSheet = mergeConfigs(modalBottomSheetData, modalBottomSheet);
    //navigation rail

    navigationRail = mergeConfigs(navigationRailData, navigationRail);
    navigationRailSelectedLableText = mergeConfigs(
        navigationRailSelectedLabelData, navigationRailSelectedLableText);

    navigationRailUnselectedLableText = mergeConfigs(
        navigationRailUnselectedLabelData, navigationRailUnselectedLableText);
    //stepper
    stepper = mergeConfigs(stepperData, stepper);
    stepperTitleText = mergeConfigs(stepperTitleTextData, stepperTitleText);
    stepperSubtitleText =
        mergeConfigs(stepperSubtitleTextData, stepperSubtitleText);
    stepperContentText =
        mergeConfigs(stepperContentTextData, stepperContentText);
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
  GSColorsToken gsColorsToken;
  final GSScreenBreakpointToken gsScreenBreakpointToken;
  final GSFontFamilyToken gsFontFamilyToken;
  final Map<String, dynamic> gsThemeToken;

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
    this.gsFontFamilyToken = const GSFontFamilyToken(),
    this.gsThemeToken = const {},
  }) {
    if (gsColorsToken.primaryColorsFromBase != null) {
      gsColorsToken = gsColorsToken.copyWith(
        primary0: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0),
        primary50: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.05),
        primary100: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.1),
        primary200: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.2),
        primary300: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.3),
        primary400: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.4),
        primary500: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.5),
        primary600: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.6),
        primary700: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.7),
        primary800: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.8),
        primary900: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.9),
        primary950: _getColorShade(gsColorsToken.primaryColorsFromBase!, 0.95),
      );
    }
    if (gsColorsToken.secondaryColorsFromBase != null) {
      gsColorsToken = gsColorsToken.copyWith(
        secondary0: _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0),
        secondary50:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.05),
        secondary100:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.1),
        secondary200:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.2),
        secondary300:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.3),
        secondary400:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.4),
        secondary500:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.5),
        secondary600:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.6),
        secondary700:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.7),
        secondary800:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.8),
        secondary900:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.9),
        secondary950:
            _getColorShade(gsColorsToken.secondaryColorsFromBase!, 0.95),
      );
    }
    _registerTokens();
  }

  Color _getColorShade(Color baseColor, double strength) {
    int r = baseColor.red;
    int g = baseColor.green;
    int b = baseColor.blue;
    final double ds = 0.5 - strength;

    final result = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );

    return result;
  }

  void _registerTokens() {
    registerSingletonIfNotRegistered<GSBorderWidthToken>(gsBorderWidthToken);
    registerSingletonIfNotRegistered<GSFontSizeToken>(gsFontSizeToken);
    registerSingletonIfNotRegistered<GSFontWeightsToken>(gsFontWeightsToken);
    registerSingletonIfNotRegistered<GSLetterSpacingToken>(
        gsLetterSpacingToken);
    registerSingletonIfNotRegistered<GSLineHeightToken>(gsLineHeightToken);
    registerSingletonIfNotRegistered<GSRadiiToken>(gsRadiiToken);
    registerSingletonIfNotRegistered<GSSpaceToken>(gsSpaceToken);
    registerSingletonIfNotRegistered<GSColorsToken>(gsColorsToken);
    registerSingletonIfNotRegistered<GSScreenBreakpointToken>(
        gsScreenBreakpointToken);
    registerSingletonIfNotRegistered<GSFontFamilyToken>(gsFontFamilyToken);
    registerSingletonIfNotRegistered<Map<String, dynamic>>(gsThemeToken);
  }
}

void registerSingletonIfNotRegistered<T extends Object>(T instance) {
  if (!getIt.isRegistered<T>()) {
    getIt.registerSingleton<T>(instance);
  }
}
