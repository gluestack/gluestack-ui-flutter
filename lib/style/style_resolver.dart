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
  print("VARIANT STYLE ---->    ${variantStyle}");
  print("INLINE STYLE ---->    ${inlineStyle}");
  GSGeneratedStyle? temp =
      variantStyle != null ? variantStyle.merge(inlineStyle) : inlineStyle;
  GSGeneratedStyle? currentGSStyle = size != null ? size.merge(temp) : temp;
  if (inlineStyle == null) {
    if (theme == GSThemeMode.dark) {
      return currentGSStyle?.merge(variantStyle?.dark);
    }
  }
  inlineStyle?.contextStyles.forEach((key, value) {
    print("HEREEEE");
    if (value != null) {
      print("HEREEEE INSIDE");
      if (key == 'dark' && theme == GSThemeMode.dark) {
        print("HEREEEE INSIDE DARK");
        currentGSStyle = currentGSStyle?.merge(value);
        GSGeneratedStyle? nestedStyle =
            resolveStyles(context, inlineStyle: value);

        currentGSStyle = currentGSStyle?.merge(nestedStyle);
      }
      if (key == 'md' && isMediumScreen(context)) {
        currentGSStyle = currentGSStyle?.merge(value);
        // print("IN HERE MD AFTER   ${currentGSStyle!.color}");
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

// GSGeneratedStyle styleResolver(BuildContext context,
//     {GSGeneratedStyle? variantStyle,
//     GSGeneratedStyle? size,
//     GSGeneratedStyle? inlineStyle}) {
//   final theme = Provider.of<ThemeProvider>(context).currentTheme;

//   if (theme == GSThemeMode.dark) {
//     return GSGeneratedStyle(
//       color: inlineStyle?.dark?.color ??
//           inlineStyle?.color ??
//           variantStyle?.dark?.color ??
//           variantStyle?.dark!.color,
//       borderColor: inlineStyle?.dark?.borderColor ??
//           inlineStyle?.borderColor ??
//           variantStyle?.dark?.borderColor ??
//           variantStyle?.dark!.borderColor,
//       padding:
//           inlineStyle?.dark?.padding ?? inlineStyle?.padding ?? size!.padding,
//       borderWidth:
//           inlineStyle?.dark?.borderWidth ?? inlineStyle?.borderWidth ?? 1.0,
//       borderRadius: inlineStyle?.dark?.borderRadius ??
//           inlineStyle?.borderRadius ??
//           size!.borderRadius,
//     );
//   }
//   return GSGeneratedStyle(
//     color: inlineStyle?.color ?? variantStyle?.color ?? variantStyle!.color,
//     borderColor: inlineStyle?.borderColor ??
//         variantStyle?.borderColor ??
//         variantStyle!.borderColor,
//     padding: inlineStyle?.padding ?? size!.padding,
//     borderWidth: inlineStyle?.borderWidth ?? 1.0,
//     borderRadius: inlineStyle?.borderRadius ?? size!.borderRadius,
//   );
// }
