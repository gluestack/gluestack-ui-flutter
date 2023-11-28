import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/refactor/style2/gs_style2.dart';
import 'package:gluestack_flutter_pro/style/style_resolver.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:gluestack_flutter_pro/widgets/gs_focusableActionDetector/gs_focusable_action_detector_proider.dart';
import 'package:provider/provider.dart';

GSStyle2 resolveStyles3(
    {required BuildContext context,
    List<GSStyle2?> styles = const [],
    GSStyle2? inlineStyle}) {
  final theme = Provider.of<ThemeProvider>(context).currentTheme;
  final isHovered = GSFocusableActionDetectorProvider.isHovered(context);
  final isFocused = GSFocusableActionDetectorProvider.isFocused(context);
  final isActive = GSFocusableActionDetectorProvider.isActive(context);

  //object is created once
  GSStyle2? currentGSStyle = GSStyle2();

  for (var style in styles) {
    currentGSStyle.merge2(style);
  }
  currentGSStyle.merge2(inlineStyle);
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && theme == GSThemeMode.dark) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'xs' && isBaseScreen(context)) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }

      if (key == 'web' && kIsWeb) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'onHover' && isHovered) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'onHover' && isHovered) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'onFocus' && isFocused) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
      if (key == 'onActive' && isActive) {
        currentGSStyle.merge2(value);
        currentGSStyle
            .merge2(resolveStyles3(context: context, inlineStyle: value));
      }
    }
  });

  return currentGSStyle;
}
