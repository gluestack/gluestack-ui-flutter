import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';
import 'package:gluestack_flutter_pro/theme_provider.dart';
import 'package:provider/provider.dart';

bool isBaseScreen(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return screenWidth < small;
}

bool isSmallScreen(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth >= small;
}

bool isMediumScreen(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth >= medium;
}

bool isLargeScreen(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  return screenWidth >= large;
}

const base = 0;
const small = 360;
const medium = 600;
const large = 960;

GSStyle? resolveStyles(
  BuildContext context, {
  GSStyle? variantStyle,
  GSStyle? size,
  GSStyle? inlineStyle,
}) {
  final theme = Provider.of<ThemeProvider>(context).currentTheme;
  GSStyle? temp =
      variantStyle != null ? variantStyle.merge(inlineStyle) : inlineStyle;

  GSStyle? currentGSStyle = size != null ? size.merge(temp) : temp;
  if (inlineStyle == null) {
    if (theme == GSThemeMode.dark) {
      return currentGSStyle?.merge(variantStyle?.dark);
    }
  }
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && theme == GSThemeMode.dark) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);

        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);

        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        // print("IN HERE sm AFTER   ${currentGSStyle!.color}");
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        // print("IN HERE xs");
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onFocus') {
        currentGSStyle?.onFocus = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle?.onFocus = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'active') {
        currentGSStyle?.active = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle?.active = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'onHover') {
        currentGSStyle?.onHover = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle?.onHover = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'disabled') {
        currentGSStyle?.disabled = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle?.disabled = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'invalid') {
        currentGSStyle?.invaild = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle?.invaild = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'web' && kIsWeb) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'ios' && defaultTargetPlatform == TargetPlatform.iOS) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'android' && defaultTargetPlatform == TargetPlatform.android) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSStyle? nestedStyle = resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
    }
  });

  return currentGSStyle;
}
