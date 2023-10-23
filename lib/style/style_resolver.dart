import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/base_style.dart';
import 'package:gluestack_flutter_pro/style/generated_style.dart';
// // import 'package:gluestack_flutter_pro/style/base_style.dart';
// import 'package:gluestack_flutter_pro/style/generated_style.dart';
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

GSGeneratedStyle? resolveStyles(
  BuildContext context, {
  GSGeneratedStyle? variantStyle,
  GSGeneratedStyle? size,
  GSGeneratedStyle? inlineStyle,
}) {
  final theme = Provider.of<ThemeProvider>(context).currentTheme;
  GSGeneratedStyle? temp =
      variantStyle != null ? variantStyle.merge(inlineStyle) : inlineStyle;

  GSGeneratedStyle? currentGSStyle = size != null ? size.merge(temp) : temp;
  
  if (inlineStyle == null) {
    if (theme == GSThemeMode.dark) {
      return currentGSStyle?.merge(variantStyle?.dark);
    }
  }
  inlineStyle?.contextStyles.forEach((key, value) {
    if (value != null) {
      if (key == 'dark' && theme == GSThemeMode.dark) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSGeneratedStyle? nestedStyle =
            resolveStyles(context, inlineStyle: value);

        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);

        GSGeneratedStyle? nestedStyle =
            resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'lg' && isLargeScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        GSGeneratedStyle? nestedStyle =
            resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'sm' && isSmallScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        // print("IN HERE sm AFTER   ${currentGSStyle!.color}");
        GSGeneratedStyle? nestedStyle =
            resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'xs' && isBaseScreen(context)) {
        // print("IN HERE xs");
        currentGSStyle = currentGSStyle?.merge(value);
        GSGeneratedStyle? nestedStyle =
            resolveStyles(context, inlineStyle: value);
        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
    }
  });
  return currentGSStyle;
}
